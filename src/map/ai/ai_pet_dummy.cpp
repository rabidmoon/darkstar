/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../../common/utils.h"

#include "../utils/battleutils.h"
#include "../utils/attackutils.h"
#include "../utils/charutils.h"
#include "../entities/charentity.h"
#include "../entities/petentity.h"
#include "../entities/mobentity.h"
#include "../entities/battleentity.h"
#include "../zone.h"
#include "../weapon_skill.h"
#include "../attack.h"
#include "../attackround.h"
#include "../mobskill.h"
#include "../utils/petutils.h"
#include "../utils/mobutils.h"
#include "../ability.h"
#include "../packets/char_health.h"

#include "../party.h"

#include "../lua/luautils.h"

#include "../packets/entity_update.h"
#include "../packets/action.h"
#include "../packets/char_update.h"
#include "../packets/pet_sync.h"
#include "../packets/message_basic.h"
#include "../entities/mobentity.h"

#include "states/magic_state.h"

#include "../alliance.h"
#include "ai_pet_dummy.h"
#include "ai_general.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIPetDummy::CAIPetDummy(CPetEntity* PPet)
{
    m_PPet = PPet;
    m_queueSic = false;
    m_PTargetFind = new CTargetFind(PPet);
    m_PPathFind = new CPathFind(PPet);

    m_PMagicState = new CMagicState(PPet, m_PTargetFind);
	
	m_curillaVokeRecast = 30000;
	m_magicRecast = 6000;
	m_magicHealRecast = 25000;
	m_magicHealCast = 0;
	m_kupipiHealRecast = 18000;
	m_kupipiHealCast = 0;
	m_curillaFlashRecast = 50000;
	m_magicKupipiRecast = 4000;
	
	
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIPetDummy::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;

    CBattleEntity* PSelf = m_PPet;

    //uncharm any pets if time is up
    if (tick > m_PPet->charmTime && m_PPet->isCharmed)
    {
        petutils::DespawnPet(m_PPet->PMaster);
        return;
    }

    switch (m_ActionType)
    {
        case ACTION_NONE:							break;
        case ACTION_ROAMING:	ActionRoaming();	break;
        case ACTION_DEATH:		ActionDeath();		break;
        case ACTION_SPAWN:		ActionSpawn();		break;
        case ACTION_FALL:		ActionFall();		break;
        case ACTION_ENGAGE:		ActionEngage();		break;
        case ACTION_ATTACK:		ActionAttack();		break;
        case ACTION_SLEEP:		ActionSleep();		break;
        case ACTION_DISENGAGE:	ActionDisengage();	break;
        case ACTION_MOBABILITY_START:	ActionAbilityStart();	break;
        case ACTION_MOBABILITY_USING: ActionAbilityUsing(); break;
        case ACTION_MOBABILITY_FINISH: ActionAbilityFinish(); break;
        case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;
        case ACTION_MAGIC_START: ActionMagicStart(); break;
        case ACTION_MAGIC_CASTING: ActionMagicCasting(); break;
        case ACTION_MAGIC_FINISH: ActionMagicFinish(); break;
		case ACTION_WEAPONSKILL_FINISH:     ActionWeaponSkillFinish();  break;
		case ACTION_JOBABILITY_FINISH:      ActionJobAbilityFinish(); break;

        //default: DSP_DEBUG_BREAK_IF(true);
    }

    //check if this AI was replaced (the new AI will update if this is the case)
    if (m_PPet && PSelf->PBattleAI == this)
    {
        m_PPet->UpdateEntity();
    }
}

void CAIPetDummy::WeatherChange(WEATHER weather, uint8 element)
{

}

void CAIPetDummy::ActionAbilityStart()
{
    uint16 petID = m_PPet->m_PetID;
	uint8 lvl = m_PPet->PMaster->GetMLevel();
	uint8 wsrandom = 0;
    if (m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
        return;
    }

    
	

	 //Choose TP Move based on Trust Type
	 // This is essentially a hack to get this to work
	 //It iterates through blank skill ID's and then sets the current mob skill to the blank unused mob ability and also assigns the correct WS number via setcurrentws
	 //On prepare pet ability it then sends the information to actionweaponskillfinish and then plays the WS animation based on the WS number
	 //The mobskill is called via the fake blank skill which is named in the mob_skill.sql file with the damage modifiers
	 if (m_PPet->m_PetID == PETID_NANAA_MIHGO && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr) { 	
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3);
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
		        //printf("Random Number: %d \n", wsrandom);
				if (lvl > 71){ // Set up so Nanaa can use either King Cobra Clamp or Dancing Edge at 71 or higher
				auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 2212 && wsrandom >= 2) { //King Kobra Clamp
                    SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("KING KOBRA CLAMP \n");
                    break;
                    }
					//else if (PMobSkill->getID() == 2213) { //WASP STING
                    //SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("WASP STING \n");
                    //break;
                    //}
					else if (PMobSkill->getID() == 2214 && wsrandom < 2) { //DANCING EDGE
                    SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("DANCING EDGE \n");
                    break;
                    } 	

                } 
				else if (lvl > 59){ // Set up so Nanaa can only use Dancing Edge
				auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
                    if (PMobSkill->getID() == 2214) { //DANCING EDGE
                    SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("DANCING EDGE \n");
                    break;
                    } 	

                }	
				else if (lvl > 5){ // Set up so Nanaa can only use wasp sting
				auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
                    if (PMobSkill->getID() == 2213) { //Wasp Sting
                    SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("WASP STING \n");
                    break;
                    } 	

                }			
			}	
            preparePetAbility(m_PBattleSubTarget);
            return;
        }
	 if (m_PPet->m_PetID == PETID_KUPIPI && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr){
			int16 mobwsID = -1;
			if (lvl > 71) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); // Black Halo or Hexa Strike
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3774 && wsrandom >= 2) { //Hexa Strike
					mobwsID = 168;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    }
                    else if (PMobSkill->getID() == 3775 && wsrandom < 2) { //Black Halo
					mobwsID = 169;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    } 						

                }
            }
            else if (lvl > 64) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Hexa Strike or Judgement
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3774 && wsrandom >= 2) { //Hexa Strike
					mobwsID = 168;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    }
                    else if (PMobSkill->getID() == 3773 && wsrandom < 2) { //Judgement
					mobwsID = 167;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    } 						

                }
            }
            else if (lvl > 59) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Judgement or True STrike
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3773 && wsrandom >= 2) { //Judgement
					mobwsID = 167;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    }
                    else if (PMobSkill->getID() == 3772 && wsrandom < 2) { //True Strike
					mobwsID = 166;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    } 						

                }
            }
           else if (lvl > 54) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //True Strike or Brainshaker
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3772 && wsrandom >= 2) { //True Strike
					mobwsID = 166;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    }
                    else if (PMobSkill->getID() == 3771 && wsrandom < 2) { //Brainshaker
					mobwsID = 162;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    } 						

                }
            }
          else if (lvl > 24) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //True Strike or Brainshaker
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3771 && wsrandom >= 2) { //Brain Shaker
					mobwsID = 162;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    }
                    else if (PMobSkill->getID() == 3770 && wsrandom < 2) { //Shining Strike
					mobwsID = 162;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
                    } 						

                }
            }	
         else if (lvl > 4) {
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3770) { //Shinning Strike
					mobwsID = 162;
					SetCurrentMobSkill(PMobSkill);
			        SetCurrentWeaponSkill(mobwsID);
                    break;
					}

                }
            }			
            preparePetAbility(m_PBattleSubTarget);
			return;	
            }			
				
           
        
	 if (m_PPet->m_PetID == PETID_AYAME && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr){
			int16 mobwsID = -1;		
			if (lvl > 71) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Gekko or Kasha only 70+ for right now
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3784 && wsrandom >= 2) { //Tachi Kasha
                    mobwsID = 152;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Kasha \n");
                    break;
                    } 
  					else if (PMobSkill->getID() == 3783 && wsrandom < 2) { //Tachi Gekko
                    mobwsID = 151;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Gekko \n");
                    break;
                    } 					

                }
			}
			else if (lvl > 64) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Gekko or Kasha only 70+ for right now
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3783 && wsrandom >= 2) { //Tachi Gekko
                    mobwsID = 151;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Gekko \n");
                    break;
                    } 
  					else if (PMobSkill->getID() == 3782 && wsrandom < 2) { //Tachi Yuki
                    mobwsID = 150;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Yuki \n");
                    break;
                    } 					

                }
			}				
			else if (lvl > 59) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Yuki or Jinpu only 
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3782 && wsrandom >= 2) { //Tachi Yuki
                    mobwsID = 150;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Yuki \n");
                    break;
                    } 
  					else if (PMobSkill->getID() == 3781 && wsrandom < 2) { //Tachi Jinpu
                    mobwsID = 148;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Jinpu \n");
                    break;
                    } 					

                }
			}
			else if (lvl > 54) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 4); //Jinpu or goten or Enpi
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3779 && wsrandom <= 2) { //Tachi Enpi
                    mobwsID = 144;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Enpi \n");
                    break;
                    }
  					else if (PMobSkill->getID() == 3780 && wsrandom == 3) { //Tachi Goten
                    mobwsID = 146;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Goten \n");
                    break;
                    } 								
  					else if (PMobSkill->getID() == 3781 && wsrandom == 4) { //Tachi Jinpu
                    mobwsID = 148;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Jinpu \n");
                    break;
                    } 					

                }
			}			
			else if (lvl > 23) {
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Jinpu or goten or Enpi
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3779 && wsrandom >= 2) { //Tachi Enpi
                    mobwsID = 144;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Enpi \n");
                    break;
                    }
  					else if (PMobSkill->getID() == 3780 && wsrandom < 2) { //Tachi Goten
                    mobwsID = 146;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Goten \n");
                    break;
                    } 													

                }
			}
			else if (lvl > 4) {
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3779) { //Tachi Enpi
                    mobwsID = 144;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Tachi: Enpi \n");
                    break;
					}						

                }
			}			
			preparePetAbility(m_PBattleSubTarget);
            return;
        }		
	 if (m_PPet->m_PetID == PETID_NAJI && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr){
			
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 2961) { //Savage Blade
                    SetCurrentMobSkill(PMobSkill);
			        //ShowWarning("KING KOBRA CLAMP \n");
                    break;
                    } 	

                }
            preparePetAbility(m_PBattleSubTarget);
            return;
        }

	if (m_PPet->m_PetID == PETID_CURILLA && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr){
			int16 mobwsID = -1;		
			if (lvl > 64) {
			m_PJobAbility = nullptr;
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Swift Blade or Vorpal
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3743 && wsrandom >= 2) { //Swift Blade
                    mobwsID = 41;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Swift Blade \n");
                    break;
                    } 
  					else if (PMobSkill->getID() == 3742 && wsrandom < 2) { //Vorpal Blade
                    mobwsID = 40;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Vorpal Blade \n");
                    break;
                    } 					

                }
			}
			else if (lvl > 59) {
			m_PJobAbility = nullptr;
			uint8 wsrandom = dsprand::GetRandomNumber(1, 3); //Vorpal or Red Lotus
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3740 && wsrandom >= 2) { //Red Lotus Blade
                    mobwsID = 34;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Red Lotus Blade \n");
                    break;
                    } 
  					else if (PMobSkill->getID() == 3742 && wsrandom < 2) { //Vorpal Blade
                    mobwsID = 40;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Vorpal Blade \n");
                    break;
                    } 					

                }
			}
			else if (lvl > 4) {
			m_PJobAbility = nullptr;
            for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
  					if (PMobSkill->getID() == 3740) { //Red Lotus Blade
                    mobwsID = 34;
					SetCurrentMobSkill(PMobSkill);
					SetCurrentWeaponSkill(mobwsID);
			        //ShowWarning("Red Lotus Blade \n");
                    break;
                    } 					

                }
			}			
            preparePetAbility(m_PBattleSubTarget);
            return;
        }		

    if (m_PPet->objtype == TYPE_MOB && m_PPet->PMaster->objtype == TYPE_PC)
    {
        if (m_MasterCommand == MASTERCOMMAND_SIC && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr)
        {
            m_MasterCommand = MASTERCOMMAND_NONE;
            CMobEntity* PMob = (CMobEntity*)m_PPet->PMaster->PPet;
            std::vector<uint16> MobSkills = battleutils::GetMobSkillList(PMob->getMobMod(MOBMOD_SKILL_LIST));

            if (MobSkills.size() > 0)
            {
                std::shuffle(MobSkills.begin(), MobSkills.end(), dsprand::mt());

                for (auto&& skillid : MobSkills)
                {
                    auto PMobSkill = battleutils::GetMobSkill(skillid);
                    if (PMobSkill && luautils::OnMobSkillCheck(m_PBattleTarget, m_PPet, PMobSkill) == 0)
                    {
                        SetCurrentMobSkill(PMobSkill);
                        break;
                    }
                }

                // could not find skill
                if (!GetCurrentMobSkill())
                {
                    TransitionBack(true);
                    return;
                }

                preparePetAbility(m_PBattleTarget);
                return;
            }
            return;
        }
    }


    if (m_PPet->getPetType() == PETTYPE_JUG_PET) {
        if (m_MasterCommand == MASTERCOMMAND_SIC && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr) { //choose random tp move
            m_MasterCommand = MASTERCOMMAND_NONE;
            if (m_PPet->PetSkills.size() > 0) {
                auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(dsprand::GetRandomNumber(m_PPet->PetSkills.size())));
                if (PMobSkill)
                {
                    SetCurrentMobSkill(PMobSkill);
                    preparePetAbility(m_PBattleTarget);
                    return;
                }
            }
        }
    }
	
	
	
	
    else if (m_PPet->getPetType() == PETTYPE_AVATAR) {
        for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
            auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
            if (PMobSkill && PMobSkill->getAnimationTime() == m_MasterCommand) {
                SetCurrentMobSkill(PMobSkill);
                m_MasterCommand = MASTERCOMMAND_NONE;
                preparePetAbility(m_PPet);
                return;
            }
        }
        m_MasterCommand = MASTERCOMMAND_NONE;
    }
    else if (m_PPet->getPetType() == PETTYPE_WYVERN) {

        WYVERNTYPE wyverntype = m_PPet->getWyvernType();

        if (m_MasterCommand == MASTERCOMMAND_ELEMENTAL_BREATH && (wyverntype == WYVERNTYPE_MULTIPURPOSE || wyverntype == WYVERNTYPE_OFFENSIVE)) {
            m_MasterCommand = MASTERCOMMAND_NONE;

            //offensive or multipurpose wyvern
            if (m_PBattleTarget != nullptr) { //prepare elemental breaths
                int skip = dsprand::GetRandomNumber(6);
                int hasSkipped = 0;

                for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                    auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
                    if (PMobSkill && PMobSkill->getValidTargets() == TARGET_ENEMY) {
                        if (hasSkipped == skip) {
                            SetCurrentMobSkill(PMobSkill);
                            break;
                        }
                        else {
                            hasSkipped++;
                        }
                    }
                }

                preparePetAbility(m_PBattleTarget);
                return;
            }

        }
        else if (m_MasterCommand == MASTERCOMMAND_HEALING_BREATH && (wyverntype == WYVERNTYPE_DEFENSIVE || wyverntype == WYVERNTYPE_MULTIPURPOSE))
        {

            m_MasterCommand = MASTERCOMMAND_NONE;
            m_PBattleSubTarget = nullptr;
            //TODO: CHECK FOR STATUS EFFECTS FOR REMOVE- BREATH (higher priority than healing breaths)

            //	if(m_PPet->PMaster->PParty==nullptr){//solo with master-kun
            CItemArmor* masterHeadItem = ((CCharEntity*)(m_PPet->PMaster))->getEquip(SLOT_HEAD);

            uint16 masterHead = masterHeadItem ? masterHeadItem->getID() : 0;

            // Determine what the required HP percentage will need to be 
            // at or under in order for healing breath to activate.
            uint8 requiredHPP = 0;
            if (((CCharEntity*)(m_PPet->PMaster))->objtype == TYPE_PC && (masterHead == 12519 || masterHead == 15238)) { //Check for player & AF head, or +1
                if (wyverntype == WYVERNTYPE_DEFENSIVE) { //healer wyvern
                    requiredHPP = 50;
                }
                else if (wyverntype == WYVERNTYPE_MULTIPURPOSE) { //hybrid wyvern
                    requiredHPP = 33;
                }
            }
            else {
                if (wyverntype == WYVERNTYPE_DEFENSIVE) { //healer wyvern
                    requiredHPP = 33;
                }
                else if (wyverntype == WYVERNTYPE_MULTIPURPOSE) { //hybrid wyvern
                    requiredHPP = 25;
                }
            }

            // Only attempt to find a target if there is an HP percentage to calculate.
            if (requiredHPP) {
                CBattleEntity* master = m_PPet->PMaster;
                // Check the master first.
                if (master->GetHPP() <= requiredHPP) {
                    m_PBattleSubTarget = master;
                }

                // Otherwise if this is a healer wyvern, and the member is in a party 
                // check all of the party members who qualify.
                else if (wyverntype == WYVERNTYPE_DEFENSIVE && master->PParty != nullptr) {
                    master->ForParty([this, requiredHPP](CBattleEntity* PTarget) {
                        if (PTarget->GetHPP() <= requiredHPP) {
                            m_PBattleSubTarget = PTarget;
                        }
                    });
                }
            }

            if (m_PBattleSubTarget != nullptr) { //target to heal
                //get highest breath for wyverns level
                m_PMobSkill = nullptr;
                for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                    auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
                    if (PMobSkill && PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY) {
                        if (PMobSkill->getID() == 638 &&
                            m_PPet->PMaster->GetMLevel() < 20) { //can only using hb1
                            SetCurrentMobSkill(PMobSkill);
                            break;
                        }
                        else if (PMobSkill->getID() == 639 &&
                            m_PPet->PMaster->GetMLevel() < 40) { //can only using hb2
                            SetCurrentMobSkill(PMobSkill);
                            break;
                        }
                        else if (PMobSkill->getID() == 640 &&
                            m_PPet->PMaster->GetMLevel() >= 40) { //can only using hb3
                            SetCurrentMobSkill(PMobSkill);
                            break;
                        }
                    }
                }
                preparePetAbility(m_PBattleSubTarget);
                return;
            }
        }
    }

    TransitionBack(true);
}

void CAIPetDummy::preparePetAbility(CBattleEntity* PTarg) {

	if (m_PJobAbility != nullptr || m_PJobAbility > 0) {
        //ShowWarning(CL_GREEN"Alternate preparepet triggered" CL_RESET);
        apAction_t Action;
        m_PPet->m_ActionList.clear();

       		
		// find correct targe
        
		
		//for weaponskill end
		
	

        Action.ActionTarget = m_PBattleSubTarget;
        Action.reaction = REACTION_HIT;
        Action.speceffect = SPECEFFECT_HIT;
        Action.animation = 0;
        Action.param = m_PJobAbility->getID();
        //Action.messageID = 43; //readies message
        Action.knockback = 0;
        m_skillTP = m_PPet->health.tp;
		
	
		
		
		
        //m_PPet->health.tp = 0;
        m_PPet->m_ActionList.push_back(Action);
        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));
		
		
        m_LastActionTime = m_Tick;
		//ShowWarning(CL_RED"PreparePetAbility for JOB ABILITY Fired!!!\n" CL_RESET);
        m_LastActionTime = m_Tick;
		       
        m_ActionType = ACTION_JOBABILITY_FINISH;
        ActionJobAbilityFinish();
		
    }


	else if (m_PWeaponSkill != nullptr || m_PWeaponSkill > 0) {
        //ShowWarning(CL_GREEN"Alternate preparepet triggered" CL_RESET);
        apAction_t Action;
        m_PPet->m_ActionList.clear();

       		
		// find correct targe
        
		
		//for weaponskill end
		
	

        Action.ActionTarget = m_PBattleSubTarget;
        Action.reaction = REACTION_HIT;
        Action.speceffect = SPECEFFECT_HIT;
        Action.animation = 0;
        Action.param = m_PWeaponSkill->getID();
        Action.messageID = 43; //readies message
        Action.knockback = 0;
        m_skillTP = m_PPet->health.tp;
		
	
		
		
		
        //m_PPet->health.tp = 0;
        m_PPet->m_ActionList.push_back(Action);
        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));
		
		Action.ActionTarget = m_PBattleSubTarget;
        m_LastActionTime = m_Tick;
		//ShowWarning(CL_RED"PreparePetAbility Fired!!!\n" CL_RESET);
        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_WEAPONSKILL_FINISH;
        ActionWeaponSkillFinish();
		
    }



    else if (m_PMobSkill != nullptr) {
        //ShowWarning(CL_RED"Normal preparepet triggered \n" CL_RESET);
        apAction_t Action;
        m_PPet->m_ActionList.clear();

        // find correct targe
        if (m_PMobSkill->getValidTargets() & TARGET_SELF)
        { //self
            m_PBattleSubTarget = m_PPet;
        }
        else if (m_PMobSkill->getValidTargets() & TARGET_PLAYER_PARTY)
        {
            // Only overwrite the sub target if it it not specified or
            // the input target doesn't match the sub target.
            if (m_PBattleSubTarget == nullptr || PTarg != m_PBattleSubTarget) {
                m_PBattleSubTarget = m_PPet->PMaster;
            }
        }
        else
        {
            if (m_PBattleTarget != nullptr)
            {
                m_PBattleSubTarget = m_PBattleTarget;
            }
            DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);
        }
		

        Action.ActionTarget = m_PBattleSubTarget;
        Action.reaction = REACTION_HIT;
        Action.speceffect = SPECEFFECT_HIT;
        Action.animation = 0;
        Action.param = m_PMobSkill->getMsgForAction();
        if (m_PMobSkill->getID() != 1688 && m_PMobSkill->getID() != 1689 && m_PMobSkill->getID() != 1690 && 
		m_PMobSkill->getID() != 1691 && m_PMobSkill->getID() != 1692 && m_PMobSkill->getID() != 1693 &&
        m_PMobSkill->getID() != 1178)  //Prevents readies message on Ranged Attacks
		{
        Action.messageID = 43; //readies message
		}
        Action.knockback = 0;
        m_skillTP = m_PPet->health.tp;
		if (m_PMobSkill->getID() != 1693 && m_PMobSkill->getID() != 1684 && m_PMobSkill->getID() != 1685 &&
        m_PMobSkill->getID() != 1686 && m_PMobSkill->getID() != 1687 && m_PMobSkill->getID() != 1688 &&
        m_PMobSkill->getID() != 1689 && m_PMobSkill->getID() != 1690 && m_PMobSkill->getID() != 1691 &&
		m_PMobSkill->getID() != 1811 && m_PMobSkill->getID() != 2488 && m_PMobSkill->getID() != 1692 &&
		m_PMobSkill->getID() != 2044 && m_PMobSkill->getID() != 1810 && m_PMobSkill->getID() != 1809 && 
		m_PMobSkill->getID() != 3711)  //Prevents Ranged Attacks and WS's from resetting TP since they are considered an ability
		{
        m_PPet->health.tp = 0;
        }
        m_PPet->m_ActionList.push_back(Action);
        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_MOBABILITY_USING;
		
    }
	
	
	

	
	
    else {
        //ShowWarning("ai_pet_dummy::ActionAbilityFinish Pet skill is NULL \n");
        TransitionBack(true);
    }
}

void CAIPetDummy::ActionAbilityUsing()
{
    DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PPet->getPetType() != PETTYPE_AVATAR);

    if (m_PPet->objtype == TYPE_MOB)
    {
        if (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()) {
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
    }
    else
    {
        if (m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()) {
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
        else if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()) {
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
        else if (m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->isDead() ||
            m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->getZone() != m_PPet->getZone()) {
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
    }

    if (m_PPet != m_PBattleSubTarget)
    {

        // move towards target if i'm too far away
        float currentDistance = distance(m_PPet->loc.p, m_PBattleSubTarget->loc.p);

        //go to target if its too far away
        if (currentDistance > m_PMobSkill->getDistance() && m_PPathFind->PathTo(m_PBattleSubTarget->loc.p, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();
        }
        else
        {
            m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);
        }
    }

    //TODO: Any checks whilst the pet is preparing.
    //NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
    //      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

    if (m_Tick > m_LastActionTime + m_PMobSkill->getActivationTime())
    {

        if (!battleutils::HasClaim(m_PPet, m_PBattleSubTarget)) {
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            // already claimed - 12
            m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PBattleSubTarget, m_PBattleSubTarget, 0, 0, 12));
            ActionAbilityInterrupt();
            return;
        }

        //Range check
        if (m_PPet->objtype == TYPE_MOB)
        {
            if (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()) {

                // Pet's target is too far away (and isn't itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
        }
        else
        {
            if (m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
                m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()) {

                // Avatar's target is too far away (and isn't the avatar itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
            else if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
                m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()) {

                // Avatar's sub target is too far away (and isn't the avatar itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
            else if (m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()) {

                // Player in the pet's party is too far away
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
        }

        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_MOBABILITY_FINISH;
        ActionAbilityFinish();
    }
}

void CAIPetDummy::ActionAbilityFinish() {

	
    //DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);
        //ShowWarning(CL_GREEN"MOBSKILL ABILITY FIRED!!! \n" CL_RESET);
	

    // reset AoE finder
    m_PTargetFind->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if (m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
        if (m_PMobSkill->isAoE())
        {
            float radius = m_PMobSkill->getDistance();

            m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
        }
        else if (m_PMobSkill->isConal())
        {
            float angle = 45.0f;
            m_PTargetFind->findWithinCone(m_PBattleSubTarget, distance, angle);
        }
        else
        {
            m_PTargetFind->findSingleTarget(m_PBattleSubTarget);
        }
    }

    uint16 totalTargets = m_PTargetFind->m_targets.size();
    //call the script for each monster hit
    m_PMobSkill->setTotalTargets(totalTargets);

    float bonusTP = m_PPet->getMod(MOD_TP_BONUS);

    if( bonusTP + m_skillTP > 300 )
       m_skillTP = 300;
    else
       m_skillTP += bonusTP;

    m_PMobSkill->setTP(m_skillTP);
    m_PMobSkill->setHPP(m_PPet->GetHPP());

    // TODO: this is totally a hack
    // override mob animation ids with valid pet animation id
    // pets need their own skills
    uint16 animationId = m_PMobSkill->getPetAnimationID();

    apAction_t Action;
    Action.ActionTarget = nullptr;
    Action.reaction = REACTION_HIT;
    Action.speceffect = SPECEFFECT_HIT;
    Action.animation = animationId;
    Action.knockback = 0;
   
    uint16 msg = 0;
    for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
    {
       
        CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;
        if (m_PPet->isBstPet()) {
            Action.param = luautils::OnMobWeaponSkill(PTarget, m_PPet, GetCurrentMobSkill());
        }
        else {
            Action.param = luautils::OnPetAbility(PTarget, m_PPet, GetCurrentMobSkill(), m_PPet->PMaster);
        }

        if (msg == 0) {
            msg = m_PMobSkill->getMsg();
        }
        else {
            msg = m_PMobSkill->getAoEMsg();
        }

        Action.messageID = msg;
		
		//Test Begin for SC
		
		        if (m_PMobSkill->hasMissMsg())
        {
            Action.reaction   = REACTION_MISS;
            Action.speceffect = SPECEFFECT_NONE;
            if (msg = m_PMobSkill->getAoEMsg())
                msg = 282;
        }
        else
        {
            Action.reaction   = REACTION_HIT;
        }

        if (Action.speceffect & SPECEFFECT_HIT)
        {
            Action.speceffect = SPECEFFECT_RECOIL;
            Action.knockback = m_PMobSkill->getKnockback();
            if (it == m_PTargetFind->m_targets.begin() && (m_PMobSkill->getSkillchain() != 0))
            {
                CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(m_PMobSkill->getSkillchain());
                if (PWeaponSkill)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        int32 skillChainDamage = battleutils::TakeSkillchainDamage(m_PPet, PTarget, Action.param);
                        if (skillChainDamage < 0)
                        {
                            Action.addEffectParam = -skillChainDamage;
                            Action.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            Action.addEffectParam = skillChainDamage;
                            Action.addEffectMessage = 287 + effect;
                        }
                        Action.additionalEffect = effect;
                    }
                }
            }
        }
		
		//Test End for SC
		
		
		

        battleutils::ClaimMob(m_PBattleSubTarget, m_PPet);

        if (PTarget->objtype == TYPE_MOB && !m_PTargetFind->checkIsPlayer(PTarget) && m_PMobSkill->isDamageMsg())
        {
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PPet, Action.param);
        }

        if (m_PBattleSubTarget->objtype == TYPE_MOB)
        {
            uint16 PWeaponskill = m_PMobSkill->getID();
            luautils::OnWeaponskillHit(m_PBattleSubTarget, m_PPet, PWeaponskill);
        }

        // If we dealt damage.. we should wake up our target..
        if (m_PMobSkill->isDamageMsg() && Action.param > 0 && PTarget->StatusEffectContainer != nullptr)
            PTarget->StatusEffectContainer->WakeUp();

        m_PPet->m_ActionList.push_back(Action);
    }
	

    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    if (Action.ActionTarget != nullptr && m_PPet->getPetType() == PETTYPE_AVATAR) { //todo: remove pet type avatar maybe
        Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget, CHAR_INRANGE, new CEntityUpdatePacket(Action.ActionTarget, ENTITY_UPDATE, UPDATE_COMBAT));
    } 

    m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_ATTACK;
}



void CAIPetDummy::ActionWeaponSkillFinish() 
{
 
    //ShowWarning(CL_GREEN"WEAPONSKILL ABILITY FINISH!!! \n" CL_RESET);
    //DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PWeaponSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

	m_PTargetFind->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if (m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
        if (m_PMobSkill->isAoE())
        {
            float radius = m_PMobSkill->getDistance();

            m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
        }
        else if (m_PMobSkill->isConal())
        {
            float angle = 45.0f;
            m_PTargetFind->findWithinCone(m_PBattleSubTarget, distance, angle);
        }
        else
        {
            m_PTargetFind->findSingleTarget(m_PBattleSubTarget);
        }
    }

    uint16 totalTargets = m_PTargetFind->m_targets.size();
    //call the script for each monster hit
    m_PMobSkill->setTotalTargets(totalTargets);

    float bonusTP = m_PPet->getMod(MOD_TP_BONUS);

    if( bonusTP + m_skillTP > 300 )
       m_skillTP = 300;
    else
       m_skillTP += bonusTP;

    m_PMobSkill->setTP(m_skillTP);
    m_PMobSkill->setHPP(m_PPet->GetHPP());

	

	uint16 animationId = m_PWeaponSkill->getAnimationId();

	//printf("Mob Weaponskill Animation ID Should be: %d \n", animationId);
	apAction_t Action;
	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation = animationId;
	Action.knockback = 0;
	

		
	m_PPet->m_ActionList.push_back(Action);

    	
	   uint16 msg = 0;
	 for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
        {
            CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;
        if (m_PPet->isBstPet()) {
            Action.param = luautils::OnMobWeaponSkill(PTarget, m_PPet, GetCurrentMobSkill());
        }
        else {
            Action.param = luautils::OnPetAbility(PTarget, m_PPet, GetCurrentMobSkill(), m_PPet->PMaster);
        }

        if (msg == 0) {
            msg = m_PMobSkill->getMsg();
        }
        else {
            msg = m_PMobSkill->getAoEMsg();
        }

        Action.messageID = msg;
		
		//Test Begin for SC
		
		        if (m_PMobSkill->hasMissMsg())
        {
            Action.reaction   = REACTION_MISS;
            Action.speceffect = SPECEFFECT_NONE;
            if (msg = m_PMobSkill->getAoEMsg())
                msg = 282;
        }
        else
        {
            Action.reaction   = REACTION_HIT;
        }

        if (Action.speceffect & SPECEFFECT_HIT)
        {
            Action.speceffect = SPECEFFECT_RECOIL;
            Action.knockback = m_PMobSkill->getKnockback();
            if (it == m_PTargetFind->m_targets.begin() && (m_PMobSkill->getSkillchain() != 0))
            {
                CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(m_PMobSkill->getSkillchain());
                if (PWeaponSkill)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        int32 skillChainDamage = battleutils::TakeSkillchainDamage(m_PPet, PTarget, Action.param);
                        if (skillChainDamage < 0)
                        {
                            Action.addEffectParam = -skillChainDamage;
                            Action.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            Action.addEffectParam = skillChainDamage;
                            Action.addEffectMessage = 287 + effect;
                        }
                        Action.additionalEffect = effect;
                    }
                }
            }
        }
		
		//Test End for SC
		
		
		

        battleutils::ClaimMob(m_PBattleSubTarget, m_PPet);

        if (PTarget->objtype == TYPE_MOB && !m_PTargetFind->checkIsPlayer(PTarget) && m_PMobSkill->isDamageMsg())
        {
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PPet, Action.param);
        }

        if (m_PBattleSubTarget->objtype == TYPE_MOB)
        {
            uint16 PWeaponskill = m_PMobSkill->getID();
            luautils::OnWeaponskillHit(m_PBattleSubTarget, m_PPet, PWeaponskill);
        }

        // If we dealt damage.. we should wake up our target..
        if (m_PMobSkill->isDamageMsg() && Action.param > 0 && PTarget->StatusEffectContainer != nullptr)
            PTarget->StatusEffectContainer->WakeUp();

        m_PPet->m_ActionList.push_back(Action);
    }
	

    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    if (Action.ActionTarget != nullptr && m_PPet->getPetType() == PETTYPE_AVATAR) { //todo: remove pet type avatar maybe
        Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget, CHAR_INRANGE, new CEntityUpdatePacket(Action.ActionTarget, ENTITY_UPDATE, UPDATE_COMBAT));
    } 

		
	m_PPet->health.tp = 5;
	m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_ATTACK;
 

}


void CAIPetDummy::ActionJobAbilityFinish()
{
 
    ShowWarning(CL_GREEN"JOB ABILITY FINISH!!! \n" CL_RESET);
    //DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    //DSP_DEBUG_BREAK_IF(m_PWeaponSkill == nullptr);
    //DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

	m_PTargetFind->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if (m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
        if (m_PMobSkill->isAoE())
        {
            float radius = m_PMobSkill->getDistance();

            m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
        }
        else if (m_PMobSkill->isConal())
        {
            float angle = 45.0f;
            m_PTargetFind->findWithinCone(m_PBattleSubTarget, distance, angle);
        }
        else
        {
            m_PTargetFind->findSingleTarget(m_PBattleSubTarget);
        }
    }

    uint16 totalTargets = m_PTargetFind->m_targets.size();
    //call the script for each monster hit
    m_PMobSkill->setTotalTargets(totalTargets);



	

	uint16 animationId = m_PJobAbility->getAnimationID();

	//printf("Mob Job Ability Animation ID Should be: %d \n", animationId);
	apAction_t Action;
	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation = animationId;
	Action.knockback = 0;
	

		
	m_PPet->m_ActionList.push_back(Action);

    	
	   uint16 msg = 0;
	 for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
        {
            CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;
        if (m_PPet->isBstPet()) {
            Action.param = luautils::OnMobWeaponSkill(PTarget, m_PPet, GetCurrentMobSkill());
        }
        else {
            Action.param = luautils::OnPetAbility(PTarget, m_PPet, GetCurrentMobSkill(), m_PPet->PMaster);
        }

        if (msg == 0) {
            msg = m_PMobSkill->getMsg();
        }
        else {
            msg = m_PMobSkill->getAoEMsg();
        }

        Action.messageID = msg;
		
        battleutils::ClaimMob(m_PBattleSubTarget, m_PPet);

        if (PTarget->objtype == TYPE_MOB && !m_PTargetFind->checkIsPlayer(PTarget) && m_PMobSkill->isDamageMsg())
        {
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PPet, Action.param);
        }

        if (m_PBattleSubTarget->objtype == TYPE_MOB)
        {
            uint16 PWeaponskill = m_PMobSkill->getID();
            luautils::OnWeaponskillHit(m_PBattleSubTarget, m_PPet, PWeaponskill);
        }

        // If we dealt damage.. we should wake up our target..
        if (m_PMobSkill->isDamageMsg() && Action.param > 0 && PTarget->StatusEffectContainer != nullptr)
            PTarget->StatusEffectContainer->WakeUp();

        m_PPet->m_ActionList.push_back(Action);
    }
	

    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    if (Action.ActionTarget != nullptr && m_PPet->getPetType() == PETTYPE_AVATAR) { //todo: remove pet type avatar maybe
        Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget, CHAR_INRANGE, new CEntityUpdatePacket(Action.ActionTarget, ENTITY_UPDATE, UPDATE_COMBAT));
    } 

		
	
	m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_ATTACK;
 

}



void CAIPetDummy::ActionAbilityInterrupt() {
    m_LastActionTime = m_Tick;
    //cancel the whole readying animation
    apAction_t Action;
    m_PPet->m_ActionList.clear();

    Action.ActionTarget = m_PPet;
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation = 0;
    Action.param = 0;
    Action.messageID = 0;
    Action.knockback = 0;

    m_PPet->m_ActionList.push_back(Action);
    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    m_PMobSkill = nullptr;
    m_ActionType = ACTION_ATTACK;
}

bool CAIPetDummy::PetIsHealing() {

    bool isMasterHealing = (m_PPet->PMaster->animation == ANIMATION_HEALING);
    bool isPetHealing = (m_PPet->animation == ANIMATION_HEALING);

    if (isMasterHealing && !isPetHealing && !m_PPet->StatusEffectContainer->HasPreventActionEffect()) {
        //animation down
        m_PPet->animation = ANIMATION_HEALING;
        m_PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 10, 0));
        m_PPet->updatemask |= UPDATE_HP;
        return true;
    }
    else if (!isMasterHealing && isPetHealing) {
        //animation up
        m_PPet->animation = ANIMATION_NONE;
        m_PPet->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
        m_PPet->updatemask |= UPDATE_HP;
        return false;
    }
	
	
	
	m_PPet->updatemask |= UPDATE_HP;
	charutils::UpdateHealth((CCharEntity*)m_PPet->PMaster);

 
    return isMasterHealing;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionRoaming()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()) {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    //automaton, wyvern
    if (m_PPet->getPetType() == PETTYPE_WYVERN || m_PPet->getPetType() == PETTYPE_AUTOMATON ||  m_PPet->getPetType() == PETTYPE_TRUST) {
        if (PetIsHealing()) {
            return;
        }
		if (m_PPet->StatusEffectContainer->HasStatusEffect(EFFECT_HEALING) == false)
		{
		m_PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 5, 0));
		}
    }

    if (m_PBattleTarget != nullptr) {
        m_ActionType = ACTION_ENGAGE;
        ActionEngage();
        return;
    }
	//ShowWarning(CL_RED"PET IS ACTION ROAMING\n" CL_RESET);
    //((CCharEntity*)m_PPet->PMaster)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PPet->PMaster));
    float currentDistance = distance(m_PPet->loc.p, m_PPet->PMaster->loc.p);


    // this is broken until pet / mob relationship gets fixed
    // pets need to extend mob or be a mob because pet has no spell list!
    if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PPet->m_Family == 104 && m_Tick >= m_LastActionTime + 30000 && currentDistance < PET_ROAM_DISTANCE * 2)
    {
        int16 spellID = 108;
        // define this so action picks it up
        SetCurrentSpell(spellID);
        m_PBattleSubTarget = m_PPet->PMaster;

        m_ActionType = ACTION_MAGIC_START;
        ActionMagicStart();
        return;
    }

    if (currentDistance > PET_ROAM_DISTANCE)
    {
        if (currentDistance < 35.0f && m_PPathFind->PathAround(m_PPet->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();
        }
        else if (m_PPet->GetSpeed() > 0)
        {
            m_PPathFind->WarpTo(m_PPet->PMaster->loc.p, PET_ROAM_DISTANCE);
        }
    }
}

void CAIPetDummy::ActionEngage()
{
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

	uint8 trustlvl = m_PPet->GetMLevel();
	if (m_PPet->getPetType() == PETTYPE_TRUST){
	m_PPet->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
	m_PPet->updatemask |= UPDATE_HP;
	}
	
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead())
    {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    if (battleutils::HasClaim(m_PPet, m_PBattleTarget))
    {
        m_PPet->animation = ANIMATION_ATTACK;
        m_PPet->updatemask |= UPDATE_HP;
        m_LastActionTime = m_Tick - 1000;
        TransitionBack(true);
    }
    else
    {
        m_PPet->animation = ANIMATION_NONE;
        m_PPet->updatemask |= UPDATE_HP;
        if (m_PPet->PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CMessageBasicPacket(((CCharEntity*)m_PPet->PMaster),
                ((CCharEntity*)m_PPet->PMaster), 0, 0, 12));
            m_ActionType = ACTION_DISENGAGE;
            return;
        }
    }
}


void CAIPetDummy::ActionAttack()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead() || m_PPet->isDead()) {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

	
	//****************************************************************//
	//   TRUST ABILITIES BY TRUST NAME                               //
	//**************************************************************//
	
	  if (m_PPet->m_PetID == PETID_KUPIPI)
		{
		 //ShowDebug("KUPIPI Check \n");
		 if (m_Tick >= m_LastKupipiMagicTime + m_magicKupipiRecast) // Check Every 4 Seconds as universal check
			{
			    int16 spellID = -1;
				uint16 family = m_PPet->m_Family;
				uint16 petID = m_PPet->m_PetID;
        
		
				spellID = KupipiSpell();
		        //printf("Kupipi Spell is: %d \n", spellID);
				if (spellID != -1)
				{
				SetCurrentSpell(spellID);
				m_ActionType = ACTION_MAGIC_START;
				ActionMagicStart();
				return;
			    }
		    }		
				
				
		}
	
	
	
	 if (m_PPet->m_PetID == PETID_CURILLA)
		{
		 if (m_Tick >= m_LastMagicTime + m_magicRecast) // Check Every 4 Seconds as universal check
			{
			    int16 spellID = -1;
				uint16 family = m_PPet->m_Family;
				uint16 petID = m_PPet->m_PetID;
        
		
				spellID = CurillaSpell();
		
				if (spellID != -1)
				{
				SetCurrentSpell(spellID);
				m_ActionType = ACTION_MAGIC_START;
				ActionMagicStart();
				return;
			    }
		    }		
		 if (m_Tick >= m_LastCurillaVokeTime + m_curillaVokeRecast)
			{
			m_PWeaponSkill = nullptr;
            int16 mobjaID = -1;			
			for (int i = 0; i < m_PPet->PetSkills.size(); i++) {
                    auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills.at(i));
                            
                        if (PMobSkill->getID() == 3711) { //Provoke
						    mobjaID = 19;
                            SetCurrentMobSkill(PMobSkill);
							SetCurrentJobAbility(mobjaID);
							m_PBattleSubTarget = m_PBattleTarget;
							break;
                        }
			        }
				preparePetAbility(m_PBattleSubTarget);
				ShowDebug("PROVOKE!!!!\n");
				m_LastCurillaVokeTime = m_Tick;
				return;	
				}				
				
		}
	


	

    //if 2 bsts are in party, make sure their pets cannot fight eachother
    if (m_PBattleTarget != nullptr && m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster != nullptr && m_PBattleTarget->PMaster->objtype == TYPE_PC)
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }


    //wyvern behaviour
    if (m_PPet->getPetType() == PETTYPE_WYVERN && m_PPet->PMaster->PBattleAI->GetBattleTarget() == nullptr) {
        m_PBattleTarget = nullptr;
    }

    //handle death of target
    if (m_PBattleTarget == nullptr ||
        m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO ||
        !battleutils::HasClaim(m_PPet, m_PBattleTarget))
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    if (m_queueSic && m_PPet->health.tp >= 1000)
    {
        // now use my tp move
        m_queueSic = false;
        m_MasterCommand = MASTERCOMMAND_SIC;
        m_ActionType = ACTION_MOBABILITY_START;
        ActionAbilityStart();
        return;
    }
	
	//Skill List Check
    /*if (m_PPet->getPetType() == PETTYPE_TRUST && m_PPet->PetSkills.size() > 0)
	{
    ShowWarning(CL_GREEN"SKILL LIST HAS A SIZE!!!!!!\n" CL_RESET);	
	}
	
	if (m_PPet->getPetType() == PETTYPE_TRUST && m_PPet->PetSkills.size() == 0)
	{
    ShowWarning(CL_RED"SKILL LIST DOES NOT HAVE A SIZE!!!!!!\n" CL_RESET);	
	}*/
	
	
	if (m_PPet->getPetType() == PETTYPE_TRUST && m_PPet->health.tp >= 1000 && m_PPet->PetSkills.size() > 0)
    {
        // now use my tp move
		m_PBattleSubTarget = m_PBattleTarget;
        m_ActionType = ACTION_MOBABILITY_START;
        ActionAbilityStart();
        return;
	}
	 

    m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    float currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);

    //go to target if its too far away
    if (currentDistance > m_PBattleTarget->m_ModelSize && m_PPet->m_PetID == PETID_NANAA_MIHGO && m_PPet->speed != 0)
    {
        if (m_PPathFind->PathBehind(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();

            // recalculate
            currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);
			
        }
		
		if (!m_PPathFind->IsFollowingPath())
		{
			//Trust has arrived at the target
			printf("I am not following /n");
			auto angle = getangle(m_PPet->loc.p, m_PBattleTarget->loc.p) + 150;
			position_t new_pos{ 0, m_PPet->loc.p.x - (cosf(rotationToRadian(angle)) * 1.5f),
				m_PBattleTarget->loc.p.y, m_PPet->loc.p.z + (sinf(rotationToRadian(angle)) * 2.5f), 0 };

				m_PPathFind->PathTo(new_pos, PATHFLAG_WALLHACK | PATHFLAG_RUN);
			
		}
		
    }
	
	
	    //go to target if its too far away
    if (currentDistance > m_PBattleTarget->m_ModelSize && m_PPet->m_PetID != PETID_NANAA_MIHGO && m_PPet->speed != 0)
    {
        if (m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();

            // recalculate
            currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);
			
        }
    }
	
	  //Move Nanaa Mihgo Behind the Target?
	if ((abs(m_PBattleTarget->loc.p.rotation - m_PPet->loc.p.rotation) > 23) &&  m_PPet->m_PetID == PETID_NANAA_MIHGO)
		{
		 ShowDebug("NANAA IS NOT BEHIND THE TARGET");
		 if (m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
		
		auto angle = getangle(m_PPet->loc.p, m_PBattleTarget->loc.p) + 64;
			position_t new_pos{ 0, m_PPet->loc.p.x - (cosf(rotationToRadian(angle)) * 1.5f),
			m_PBattleTarget->loc.p.y, m_PPet->loc.p.z + (sinf(rotationToRadian(angle)) * 2.5f), 0 };
			if (m_PPathFind->PathTo(new_pos, PATHFLAG_RUN | PATHFLAG_WALLHACK))
			{
				m_PPathFind->FollowPath();
			}
		
            
        }
		}
	
	

	
	if ((abs(m_PBattleTarget->loc.p.rotation - m_PPet->loc.p.rotation) > 23) &&  m_PPet->m_PetID == PETID_NANAA_MIHGO)
	    {
	    ShowWarning(CL_RED"Nanaa Mihgo is NOT behind the target!!!!!!\n" CL_RESET);
		}
	

    if (currentDistance <= m_PBattleTarget->m_ModelSize)
    {
        int32 WeaponDelay = m_PPet->m_Weapons[SLOT_MAIN]->getDelay();
        //try to attack
        if (m_Tick > m_LastActionTime + WeaponDelay) {
            if (battleutils::IsParalyzed(m_PPet))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 29));
            }
            else if (battleutils::IsIntimidated(m_PPet, m_PBattleTarget))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 106));
            }
            else
            {
                apAction_t Action;
                m_PPet->m_ActionList.clear();

                Action.ActionTarget = m_PBattleTarget;

                uint8 numAttacks = battleutils::CheckMultiHits(m_PPet, m_PPet->m_Weapons[SLOT_MAIN]);

                for (uint8 i = 0; i < numAttacks; i++) {
                    Action.reaction = REACTION_EVADE;
                    Action.speceffect = SPECEFFECT_NONE;
                    Action.animation = 0;
                    Action.param = 0;
                    Action.messageID = 15;
                    Action.knockback = 0;
                    //ShowDebug("pet hp %i and atk %i def %i eva is %i \n",m_PPet->health.hp,m_PPet->ATT(),m_PPet->DEF(),m_PPet->getMod(MOD_EVA));
                    int32 damage = 0;

                    if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
                    {
                        Action.messageID = 32;
                    }
                    else if ((dsprand::GetRandomNumber(100) < battleutils::GetHitRate(m_PPet, m_PBattleTarget)) &&
                        !m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
                    {
                        if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
                        {
                            Action.messageID = 31;
                            Action.param = 1;
                            Action.reaction = REACTION_EVADE;
                        }
                        else
                        {
                            Action.reaction = REACTION_HIT;
                            Action.speceffect = SPECEFFECT_HIT;
                            Action.messageID = 1;

                            bool isCritical = (dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PPet, m_PBattleTarget, false));
                            float DamageRatio = battleutils::GetDamageRatio(m_PPet, m_PBattleTarget, isCritical, 0);

                            if (isCritical)
                            {

                                Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                                Action.messageID = 67;
                            }

                            damage = (int32)((m_PPet->GetMainWeaponDmg() + battleutils::GetFSTR(m_PPet, m_PBattleTarget, SLOT_MAIN)) * DamageRatio);
                        }
                    }
                    else {
                        // create enmity even on misses
                        if (m_PBattleTarget->objtype == TYPE_MOB) {
                            CMobEntity* PMob = (CMobEntity*)m_PBattleTarget;
                            PMob->PEnmityContainer->UpdateEnmity(m_PPet, 0, 0);
                        }
                    }
                    if (m_PBattleTarget->objtype == TYPE_PC)
                    {
                        charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PPet->GetMLevel());
                    }

                    bool isBlocked = (dsprand::GetRandomNumber(100) < battleutils::GetBlockRate(m_PPet, m_PBattleTarget));
                    if (isBlocked) { Action.reaction = REACTION_BLOCK; }


                    Action.param = battleutils::TakePhysicalDamage(m_PPet, m_PBattleTarget, damage, isBlocked, SLOT_MAIN, 1, nullptr, true, true);
                    if (Action.param < 0)
                    {
                        Action.param = -(Action.param);
                        Action.messageID = 373;
                    }

                    // spike effect
                    if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
                    {

                        battleutils::HandleEnspell(m_PPet, m_PBattleTarget, &Action, i, m_PPet->m_Weapons[SLOT_MAIN], damage);
                        battleutils::HandleSpikesDamage(m_PPet, m_PBattleTarget, &Action, damage);
                    }

                    m_PPet->m_ActionList.push_back(Action);
                }

                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

                if (m_PPet->PMaster != nullptr && m_PPet->PMaster->objtype == TYPE_PC && m_PPet->PMaster->PPet != nullptr) {
                    ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
                }
            }
            m_LastActionTime = m_Tick;

            // Update the targets attacker level..
            CMobEntity* Monster = (CMobEntity*)m_PBattleTarget;
            if (Monster->m_HiPCLvl < ((CCharEntity*)m_PPet->PMaster)->GetMLevel())
                Monster->m_HiPCLvl = ((CCharEntity*)m_PPet->PMaster)->GetMLevel();
        }
    }
}

void CAIPetDummy::ActionSleep()
{
    if (!m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
        TransitionBack();
    }
}

void CAIPetDummy::ActionDisengage()
{
    uint8 trustlvl = m_PPet->GetMLevel();
	

    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()) {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }
	
	//Add Regen and Refresh to Trusts
	if (m_PPet->getPetType() == PETTYPE_TRUST){
	m_PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 5, 0));
	 ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CCharHealthPacket((CCharEntity*)m_PPet->PMaster));
	}
    m_queueSic = false;
    m_PPet->animation = ANIMATION_NONE;
    m_PPet->updatemask |= UPDATE_HP;
    m_LastActionTime = m_Tick;
    m_PBattleTarget = nullptr;
    TransitionBack();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionFall()
{
    bool isMob = m_PPet->objtype == TYPE_MOB;
    // remove master from pet
    if (m_PPet->PMaster != nullptr && m_PPet->PMaster->PPet == m_PPet) {
        petutils::DetachPet(m_PPet->PMaster);
	}
	uint8 counter = 0;
	if (m_PPet->PMaster != nullptr && m_PPet->PMaster->PAlly.size() != 0) {
		for (auto ally : m_PPet->PMaster->PAlly)
		{
			if (ally == m_PPet)
			{
				m_PPet->PMaster->PAlly.erase(m_PPet->PMaster->PAlly.begin() + counter);
				m_PPet->PMaster->PParty->ReloadParty();
				
				break;
			}
			counter++;
		}
	}

    // detach pet just deleted this
    // so break out of here
    if (isMob) {
        return;
    }

    m_PPet->updatemask |= UPDATE_HP;
    m_PPet->UpdateEntity();

    m_LastActionTime = m_Tick;
    m_ActionType = ACTION_DEATH;
}

void CAIPetDummy::ActionDeath()
{
    if (m_Tick - m_LastActionTime > 3000) {
        m_PPet->status = STATUS_DISAPPEAR;
        m_PPet->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN, UPDATE_NONE));

        m_ActionType = ACTION_NONE;
    }
}

void CAIPetDummy::ActionMagicStart()
{
    // disabled
    //DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;

    STATESTATUS status = m_PMagicState->CastSpell(GetCurrentSpell(), m_PBattleSubTarget);

    if (status == STATESTATUS_START)
    {
        m_ActionType = ACTION_MAGIC_CASTING;
    }
    else
    {
        TransitionBack(true);
    }

}

void CAIPetDummy::ActionMagicCasting()
{
    m_PPathFind->LookAt(m_PMagicState->GetTarget()->loc.p);

    STATESTATUS status = m_PMagicState->Update(m_Tick);

    if (status == STATESTATUS_INTERRUPT)
    {
        m_ActionType = ACTION_MAGIC_INTERRUPT;
        ActionMagicInterrupt();
    }
    else if (status == STATESTATUS_ERROR)
    {
        TransitionBack(true);
    }
    else if (status == STATESTATUS_FINISH)
    {
        m_ActionType = ACTION_MAGIC_FINISH;
        ActionMagicFinish();
    }
}

void CAIPetDummy::ActionMagicFinish()
{
    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;

    m_PMagicState->FinishSpell();

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

void CAIPetDummy::ActionMagicInterrupt()
{
    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;

    m_PMagicState->InterruptSpell();

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

/************************************************************************
*																		*
*  При появлении питомца задержка в 4.5 секунды перед началом			*
*  следования за персонажем. Состояние может быть перезаписано.			*
*																		*
************************************************************************/

void CAIPetDummy::ActionSpawn()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()) {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    if (m_Tick > m_LastActionTime + 4000)
    {
        m_ActionType = ACTION_ROAMING;
    }
}

/************************************************************************
*																		*
*  Sends the too far away message and interrupts the pet from			*
*  performing its action. Changes to the interrupt state.				*
*																		*
************************************************************************/

void CAIPetDummy::SendTooFarInterruptMessage(CBattleEntity* PTarg)
{
    m_ActionType = ACTION_MOBABILITY_INTERRUPT;
    //too far away message = 78
    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(PTarg, PTarg, 0, 0, 78));
    ActionAbilityInterrupt();
}

void CAIPetDummy::TransitionBack(bool skipWait)
{

    if (m_PPet->animation == ANIMATION_ATTACK)
    {
        m_ActionType = ACTION_ATTACK;
        if (skipWait)
        {
            ActionAttack();
        }
    }
    else
    {
        m_ActionType = ACTION_ROAMING;
        if (skipWait)
        {
            ActionRoaming();
        }
    }
}

int16 CAIPetDummy::KupipiSpell()
{

	uint8 trigger = 60; // HP Trigger Threshold
	uint8 lowHPP = 31;
	uint8 level = m_PPet->GetMLevel();
    int16 spellID = -1;
	
 CBattleEntity* master = m_PPet->PMaster;  
 CBattleEntity* mostWounded = getWounded(trigger);
if (m_Tick >= m_LastKupipiMagicTime + m_kupipiHealRecast)  // Look for last magic healing spell time 
	{
		if (mostWounded != nullptr)
		{
        m_PBattleSubTarget = mostWounded;
		if (level > 54)
			if (m_PPet->health.mp > 88)
				{
				 spellID = 4;
				}
			else if (m_PPet->health.mp > 46)  	
			    {
				 spellID = 3;
				}
			else if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else 
			    {
				 spellID = -1;
				} 
		else if (level > 29)
			if (m_PPet->health.mp > 46)  	
			    {
				 spellID = 3;
				}
			else if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				}
		else if (level > 16)
			if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				}
		else if (level > 4)
			if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				} 
		else
		        {
				 spellID = -1;
				} 
		if (m_PPet->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) == true)
		{
	    spellID = -1;
		} 
        m_kupipiHealRecast = 18000; 
		m_kupipiHealCast = 1; // 1 means casting a spell
		}
		else
		{
		m_LastKupipiMagicTime = m_Tick; // reset mtick no eligible healing spell to cast
		m_kupipiHealRecast = 11000;		
       }
	} 

	
	return spellID;

}



int16 CAIPetDummy::CurillaSpell()
{

	uint8 trigger = 45; // HP Trigger Threshold
	uint8 lowHPP = 31;
	uint8 level = m_PPet->GetMLevel();
    int16 spellID = -1;
	
 CBattleEntity* master = m_PPet->PMaster;  
 CBattleEntity* mostWounded = getWounded(trigger);
if (m_Tick >= m_LastMagicTimeHeal + m_magicHealRecast)  // Look for last magic healing spell time 
	{
		if (mostWounded != nullptr)
		{
        m_PBattleSubTarget = mostWounded;
		if (level > 54)
			if (m_PPet->health.mp > 88)
				{
				 spellID = 4;
				}
			else if (m_PPet->health.mp > 46)  	
			    {
				 spellID = 3;
				}
			else if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else 
			    {
				 spellID = -1;
				} 
		else if (level > 29)
			if (m_PPet->health.mp > 46)  	
			    {
				 spellID = 3;
				}
			else if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				}
		else if (level > 16)
			if (m_PPet->health.mp > 24)  	
			    {
				 spellID = 2;
				}				
			else if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				}
		else if (level > 4)
			if (m_PPet->health.mp > 7)  	
			    {
				 spellID = 1;
				}
			else
			    {
				 spellID = -1;
				} 
		else
		        {
				 spellID = -1;
				} 
		if (m_PPet->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) == true)
		{
	    spellID = -1;
		} 
		
        m_magicHealRecast = 25000; 
		m_magicHealCast = 1; // 1 means casting a spell
		}
		else
		{
		m_LastMagicTimeHeal = m_Tick; // reset mtick no eligible healing spell to cast
		m_magicHealRecast = 14000;		
       }
	} 
	else if (m_Tick >= m_LastCurillaFlash + m_curillaFlashRecast)  // Look for last flash spell time 
	{
	    m_PBattleSubTarget = m_PBattleTarget;
        if (level >= 37)
		    if (m_PPet->health.mp > 25)  	
			    {
				 spellID = 112;
				}
			else
			    {
				 spellID = -1;
				}	
		m_curillaFlashRecast = 50000;
        m_LastCurillaFlash = m_Tick;
    }		
	
	return spellID;
 
 

}



CBattleEntity* CAIPetDummy::getWounded(uint8 threshold)
{
    uint8 lowest = 100;
    CBattleEntity* mostWounded = nullptr;
    if (m_PPet->PMaster == nullptr)
        return nullptr;
    if (m_PPet->PMaster->GetHPP() < lowest){
        lowest = m_PPet->PMaster->GetHPP();
        mostWounded = m_PPet->PMaster;
    }
    if (m_PPet->PMaster->PPet != nullptr && m_PPet->PMaster->PPet->GetHPP() < lowest)
    {
        lowest = m_PPet->PMaster->PPet->GetHPP();
        mostWounded = m_PPet->PMaster->PPet;
    }
    if (m_PPet->PMaster->PParty != nullptr)  //Certain Trusts can't heal other members
    {
        for (auto member : m_PPet->PMaster->PParty->members)
        {
            if ( member->GetHPP() < lowest)
            {
                lowest = member->GetHPP();
                mostWounded = member;
            }
        }
    }
    if (m_PPet->PMaster->PAlly.size() > 0)  //Certain Trusts can't heal other members
    {
        for (auto ally : m_PPet->PMaster->PAlly)
        {
            if ( ally->GetHPP() < lowest)
            {
                lowest = ally->GetHPP();
                mostWounded = ally;
            }
        }
    }
    
    if (lowest <= threshold)
    {
        return mostWounded;
    }
    else
    {
        return nullptr;
    }

}