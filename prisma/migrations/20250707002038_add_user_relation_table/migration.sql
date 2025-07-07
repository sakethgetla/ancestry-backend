/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "RelationType" AS ENUM ('CHILD', 'SPOUSE');

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_relation" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "relation_type" "RelationType" NOT NULL,
    "user_id2" TEXT NOT NULL,

    CONSTRAINT "user_relation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "user_relation" ADD CONSTRAINT "user_relation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_relation" ADD CONSTRAINT "user_relation_user_id2_fkey" FOREIGN KEY ("user_id2") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
