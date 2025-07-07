/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_relation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "user_relation" DROP CONSTRAINT "user_relation_user_id2_fkey";

-- DropForeignKey
ALTER TABLE "user_relation" DROP CONSTRAINT "user_relation_user_id_fkey";

-- DropTable
DROP TABLE "user";

-- DropTable
DROP TABLE "user_relation";

-- CreateTable
CREATE TABLE "ancestor" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ancestor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ancestor_relation" (
    "id" TEXT NOT NULL,
    "ancestor_id" TEXT NOT NULL,
    "relation_type" "relation_type" NOT NULL,
    "ancestor_id2" TEXT NOT NULL,

    CONSTRAINT "ancestor_relation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ancestor_email_key" ON "ancestor"("email");

-- AddForeignKey
ALTER TABLE "ancestor_relation" ADD CONSTRAINT "ancestor_relation_ancestor_id_fkey" FOREIGN KEY ("ancestor_id") REFERENCES "ancestor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ancestor_relation" ADD CONSTRAINT "ancestor_relation_ancestor_id2_fkey" FOREIGN KEY ("ancestor_id2") REFERENCES "ancestor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
