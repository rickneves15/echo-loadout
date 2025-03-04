-- CreateEnum
CREATE TYPE "WeaponType" AS ENUM ('ASSAULT_RIFLE', 'SMG', 'LMG', 'SHOTGUN', 'MARKSMAN_RIFLE', 'RIFLE', 'PISTOL', 'EXOTIC');

-- CreateEnum
CREATE TYPE "ItemRarity" AS ENUM ('HIGH_END', 'NAMED', 'EXOTIC');

-- CreateEnum
CREATE TYPE "WeaponModType" AS ENUM ('OPTICS', 'BARREL', 'MAGAZINE', 'UNDERBARREL', 'MUZZLE');

-- CreateEnum
CREATE TYPE "WeaponSlot" AS ENUM ('PRIMARY', 'SIDEARM');

-- CreateEnum
CREATE TYPE "WeaponCoreAttribute" AS ENUM ('ASSAULT_RIFLE_DAMAGE', 'SMG_DAMAGE', 'LMG_DAMAGE', 'SHOTGUN_DAMAGE', 'MARKSMAN_RIFLE_DAMAGE', 'PISTOL_DAMAGE', 'RIFLE_DAMAGE');

-- CreateEnum
CREATE TYPE "WeaponMinorAttribute" AS ENUM ('HEALTH_DAMAGE', 'CRITICAL_HIT_CHANCE', 'CRITICAL_HIT_DAMAGE', 'HEADSHOT_DAMAGE');

-- CreateEnum
CREATE TYPE "WeaponVariableAttributeType" AS ENUM ('DMG_OUT_OF_COVER', 'DAMAGE_TO_ARMOR', 'HEALTH_DAMAGE', 'CRITICAL_HIT_CHANCE', 'CRITICAL_HIT_DAMAGE', 'HEADSHOT_DAMAGE', 'RELOAD_SPEED', 'STABILITY', 'ACCURACY', 'OPTIMAL_RANGE', 'MAGAZINE_SIZE', 'RATE_OF_FIRE', 'SWAP_SPEED');

-- CreateEnum
CREATE TYPE "TalentTriggerType" AS ENUM ('ON_KILL', 'ON_HIT', 'ON_SHOT', 'ON_CRIT');

-- CreateEnum
CREATE TYPE "SpecializationType" AS ENUM ('DEMOLITIONIST', 'SHARPSHOOTER', 'SURVIVALIST', 'GUNNER', 'TECHNICIAN', 'FIREWALL');

-- CreateEnum
CREATE TYPE "GearType" AS ENUM ('IMPROVISED', 'BRAND_SET', 'GEAR_SET', 'NAMED', 'EXOTIC');

-- CreateEnum
CREATE TYPE "GearSlot" AS ENUM ('MASK', 'CHEST', 'BACKPACK', 'GLOVES', 'KNEEPADS', 'HOLSTER');

-- CreateEnum
CREATE TYPE "GearCoreAttribute" AS ENUM ('WEAPON_DAMAGE', 'ARMOR', 'SKILL_TIER');

-- CreateEnum
CREATE TYPE "GearAttributeCategory" AS ENUM ('OFFENSIVE', 'DEFENSIVE', 'UTILITY');

-- CreateEnum
CREATE TYPE "GearModStat" AS ENUM ('CRIT_HIT_CHANCE', 'CRIT_HIT_DAMAGE', 'HEADSHOT_DAMAGE', 'ARMOR_ON_KILL', 'BLEED_RESISTANCE', 'BLIND_DEAF_RESISTANCE', 'BURN_RESISTANCE', 'DISORIENT_RESISTANCE', 'DISRUPT_RESISTANCE', 'ENSNARE_RESISTANCE', 'INCOMING_REPAIRS', 'PROTECTION_FROM_ELITES', 'PULSE_RESISTANCE', 'SHOCK_RESISTANCE', 'REPAIR_SKILLS', 'SKILL_DURATION', 'SKILL_HASTE');

-- CreateEnum
CREATE TYPE "SkillCategory" AS ENUM ('DRONE', 'TURRET', 'SEEKER_MINE', 'HIVE', 'FIREFLY', 'SHIELD', 'PULSE', 'CHEM_LAUNCHER');

-- CreateEnum
CREATE TYPE "SkillTier" AS ENUM ('TIER_0', 'TIER_1', 'TIER_2', 'TIER_3', 'TIER_4', 'TIER_5', 'TIER_6');

-- CreateTable
CREATE TABLE "weapons" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "dps" BIGINT NOT NULL,
    "dpm" BIGINT NOT NULL,
    "talentId" TEXT NOT NULL,
    "acquisition" TEXT,
    "useOverrideStats" BOOLEAN NOT NULL DEFAULT false,
    "weaponImage" TEXT,
    "type" "WeaponType" NOT NULL,
    "slot" "WeaponSlot" NOT NULL,
    "rarity" "ItemRarity" NOT NULL,
    "coreAttribute" "WeaponCoreAttribute" NOT NULL,
    "minorAttribute" "WeaponMinorAttribute",
    "variableAttribute" "WeaponVariableAttributeType",
    "weaponBaseStatsId" TEXT NOT NULL,
    "exoticEffectId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "weapons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "weapon_variants" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "weaponBaseStatsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "weapon_variants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "weapon_base_stats" (
    "id" TEXT NOT NULL,
    "baseDamage" DOUBLE PRECISION NOT NULL,
    "rpm" INTEGER NOT NULL,
    "magazineSize" INTEGER NOT NULL,
    "reloadSpeed" DOUBLE PRECISION NOT NULL,
    "accuracy" DOUBLE PRECISION NOT NULL,
    "stability" DOUBLE PRECISION NOT NULL,
    "optimalRange" DOUBLE PRECISION NOT NULL,
    "hsd" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "weapon_base_stats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "weapon_override_stats" (
    "id" TEXT NOT NULL,
    "baseDamage" DOUBLE PRECISION NOT NULL,
    "rpm" INTEGER NOT NULL,
    "magazineSize" INTEGER NOT NULL,
    "reloadSpeed" DOUBLE PRECISION NOT NULL,
    "accuracy" DOUBLE PRECISION NOT NULL,
    "stability" DOUBLE PRECISION NOT NULL,
    "optimalRange" DOUBLE PRECISION NOT NULL,
    "hsd" DOUBLE PRECISION NOT NULL,
    "weaponId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "weapon_override_stats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "weapon_mods" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "WeaponModType" NOT NULL,
    "positiveBonusAttribute" TEXT NOT NULL,
    "positiveBonusValue" DOUBLE PRECISION NOT NULL,
    "positiveUnit" TEXT NOT NULL,
    "negativeBonusAttribute" TEXT NOT NULL,
    "negativeBonusValue" DOUBLE PRECISION NOT NULL,
    "negativeUnit" TEXT NOT NULL,
    "compatibleTypes" "WeaponType"[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "weapon_mods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "talents" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "cooldown" INTEGER,
    "triggerType" "TalentTriggerType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "talents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "specializations" (
    "id" TEXT NOT NULL,
    "name" "SpecializationType" NOT NULL,
    "description" TEXT NOT NULL,
    "passiveBuffs" TEXT[],
    "weaponBonus" "WeaponType",
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "specializations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gears" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "GearType" NOT NULL,
    "slot" "GearSlot" NOT NULL,
    "rarity" "ItemRarity" NOT NULL,
    "coreAttribute" "GearCoreAttribute" NOT NULL,
    "armorValue" INTEGER NOT NULL,
    "imageUrl" TEXT,
    "isExotic" BOOLEAN NOT NULL DEFAULT false,
    "exoticEffectId" TEXT,
    "brandSetId" TEXT,
    "gearSetId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "gears_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "brand_sets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "brand_sets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "brand_bonuses" (
    "id" TEXT NOT NULL,
    "pieces" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "brandSetId" TEXT NOT NULL,

    CONSTRAINT "brand_bonuses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gear_sets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "gear_sets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gear_set_bonuses" (
    "id" TEXT NOT NULL,
    "pieces" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "gearSetId" TEXT NOT NULL,

    CONSTRAINT "gear_set_bonuses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gear_attributes" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "category" "GearAttributeCategory" NOT NULL,
    "gearId" TEXT NOT NULL,

    CONSTRAINT "gear_attributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gear_mods" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "stat" "GearModStat" NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "allowedSlots" "GearSlot"[],

    CONSTRAINT "gear_mods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exotic_effects" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "exotic_effects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" "SkillCategory" NOT NULL,
    "description" TEXT NOT NULL,
    "cooldown" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skill_mods" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "effect" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "requiredTier" "SkillTier",
    "skillId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "skill_mods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_WeaponToWeaponMod" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_WeaponToWeaponMod_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_GearToTalent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GearToTalent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "weapons_name_key" ON "weapons"("name");

-- CreateIndex
CREATE INDEX "weapons_name_idx" ON "weapons"("name");

-- CreateIndex
CREATE UNIQUE INDEX "weapon_variants_weaponBaseStatsId_key" ON "weapon_variants"("weaponBaseStatsId");

-- CreateIndex
CREATE UNIQUE INDEX "weapon_override_stats_weaponId_key" ON "weapon_override_stats"("weaponId");

-- CreateIndex
CREATE INDEX "talents_name_idx" ON "talents"("name");

-- CreateIndex
CREATE UNIQUE INDEX "gears_name_key" ON "gears"("name");

-- CreateIndex
CREATE INDEX "gears_name_idx" ON "gears"("name");

-- CreateIndex
CREATE INDEX "brand_sets_name_idx" ON "brand_sets"("name");

-- CreateIndex
CREATE INDEX "gear_sets_name_idx" ON "gear_sets"("name");

-- CreateIndex
CREATE INDEX "exotic_effects_name_idx" ON "exotic_effects"("name");

-- CreateIndex
CREATE INDEX "skills_name_idx" ON "skills"("name");

-- CreateIndex
CREATE INDEX "skill_mods_name_idx" ON "skill_mods"("name");

-- CreateIndex
CREATE INDEX "_WeaponToWeaponMod_B_index" ON "_WeaponToWeaponMod"("B");

-- CreateIndex
CREATE INDEX "_GearToTalent_B_index" ON "_GearToTalent"("B");

-- AddForeignKey
ALTER TABLE "weapons" ADD CONSTRAINT "weapons_weaponBaseStatsId_fkey" FOREIGN KEY ("weaponBaseStatsId") REFERENCES "weapon_base_stats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "weapons" ADD CONSTRAINT "weapons_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "talents"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "weapons" ADD CONSTRAINT "weapons_exoticEffectId_fkey" FOREIGN KEY ("exoticEffectId") REFERENCES "exotic_effects"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "weapon_variants" ADD CONSTRAINT "weapon_variants_weaponBaseStatsId_fkey" FOREIGN KEY ("weaponBaseStatsId") REFERENCES "weapon_base_stats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "weapon_override_stats" ADD CONSTRAINT "weapon_override_stats_weaponId_fkey" FOREIGN KEY ("weaponId") REFERENCES "weapons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gears" ADD CONSTRAINT "gears_brandSetId_fkey" FOREIGN KEY ("brandSetId") REFERENCES "brand_sets"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gears" ADD CONSTRAINT "gears_gearSetId_fkey" FOREIGN KEY ("gearSetId") REFERENCES "gear_sets"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gears" ADD CONSTRAINT "gears_exoticEffectId_fkey" FOREIGN KEY ("exoticEffectId") REFERENCES "exotic_effects"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "brand_bonuses" ADD CONSTRAINT "brand_bonuses_brandSetId_fkey" FOREIGN KEY ("brandSetId") REFERENCES "brand_sets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gear_set_bonuses" ADD CONSTRAINT "gear_set_bonuses_gearSetId_fkey" FOREIGN KEY ("gearSetId") REFERENCES "gear_sets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gear_attributes" ADD CONSTRAINT "gear_attributes_gearId_fkey" FOREIGN KEY ("gearId") REFERENCES "gears"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skill_mods" ADD CONSTRAINT "skill_mods_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WeaponToWeaponMod" ADD CONSTRAINT "_WeaponToWeaponMod_A_fkey" FOREIGN KEY ("A") REFERENCES "weapons"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WeaponToWeaponMod" ADD CONSTRAINT "_WeaponToWeaponMod_B_fkey" FOREIGN KEY ("B") REFERENCES "weapon_mods"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GearToTalent" ADD CONSTRAINT "_GearToTalent_A_fkey" FOREIGN KEY ("A") REFERENCES "gears"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GearToTalent" ADD CONSTRAINT "_GearToTalent_B_fkey" FOREIGN KEY ("B") REFERENCES "talents"("id") ON DELETE CASCADE ON UPDATE CASCADE;
