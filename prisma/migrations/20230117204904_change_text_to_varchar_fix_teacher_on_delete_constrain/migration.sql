/*
  Warnings:

  - You are about to alter the column `name` on the `Group` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `name` on the `Student` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `surname` on the `Student` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `name` on the `Subject` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `name` on the `Teacher` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `surname` on the `Teacher` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `degree` on the `Teacher` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.

*/
-- DropForeignKey
ALTER TABLE "Lesson" DROP CONSTRAINT "Lesson_teacherId_fkey";

-- AlterTable
ALTER TABLE "Group" ALTER COLUMN "name" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Lesson" ALTER COLUMN "teacherId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Student" ALTER COLUMN "name" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "surname" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Subject" ALTER COLUMN "name" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Teacher" ALTER COLUMN "name" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "surname" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "degree" SET DATA TYPE VARCHAR(200);

-- AddForeignKey
ALTER TABLE "Lesson" ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "Teacher"("id") ON DELETE SET NULL ON UPDATE CASCADE;
