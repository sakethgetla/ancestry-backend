/*
  Warnings:

  - Changed the type of `relation_type` on the `user_relation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "relation_type" AS ENUM ('CHILD', 'SPOUSE');

-- AlterTable
ALTER TABLE "user_relation" DROP COLUMN "relation_type",
ADD COLUMN     "relation_type" "relation_type" NOT NULL;

-- DropEnum
DROP TYPE "RelationType";
