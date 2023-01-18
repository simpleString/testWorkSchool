/*
  Warnings:

  - A unique constraint covering the columns `[groupId,subjectId,teacherId]` on the table `Lesson` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Lesson_groupId_subjectId_teacherId_key" ON "Lesson"("groupId", "subjectId", "teacherId");
