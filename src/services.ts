import {
  Group,
  Lesson,
  PrismaClient,
  Student,
  Subject,
  Teacher,
} from "@prisma/client";
import {
  CommonLesson,
  CreateLesson,
  CreateTeacher,
  UpdateLesson,
  UpdateTeacher,
} from "./types";

const prisma = new PrismaClient();

export const getAllLessons = async () => {
  const lessons = await prisma.$queryRaw<
    CommonLesson[]
  >`SELECT L.id, G."name" as "group", S."name" as subject, T."name" as tname, T.surname as tSurname FROM public."Lesson" as L
  JOIN public."Group" as G ON G.id = L."groupId"
  JOIN public."Subject" as S ON S.id = L."subjectId"
  LEFT OUTER JOIN public."Teacher" as T ON T.id = L."teacherId"`;
  console.log(lessons);

  return lessons;
};

export const createLesson = async (data: CreateLesson) => {
  try {
    const newLessonResult =
      await prisma.$executeRaw`INSERT INTO public."Lesson"(
      "teacherId", "groupId", "subjectId")
      VALUES (${data.teacherId}, ${data.groupId}, ${data.subjectId});`;
  } catch (error: any) {
    if (error.meta.code === "23505") {
      console.log("Unique constrain");
    }
  }
};

export const getLessonById = async (id: number) => {
  const lessons = await prisma.$queryRaw<
    Lesson[]
  >`SELECT * FROM public."Lesson" WHERE id = ${id};`;
  if (lessons.length === 1) return lessons[0];
};

export const updateLesson = async (data: UpdateLesson) => {
  try {
    const updateLessonResult = await prisma.$executeRaw`UPDATE public."Lesson"
	SET "teacherId"=${data.teacherId}, "groupId"=${data.groupId}, "subjectId"=${data.subjectId}
	WHERE id = ${data.id};`;
  } catch (error: any) {
    if (error.meta.code === "23505") {
      console.log("Unique constrain");
    }
  }
};

export const deleteLesson = async (lessonId: number) => {
  const deleteLessonResult =
    await prisma.$executeRaw`DELETE FROM public."Lesson"
	WHERE id = ${lessonId};`;
};

export const getStudentsForLessonById = async (lessonId: number) => {
  const students = await prisma.$queryRaw<
    Student[]
  >`SELECT "Student"."name", "Student".surname FROM "Student"
    JOIN "Group" ON "Group".id = "Student"."groupId"
    JOIN "Lesson" ON "Lesson"."groupId" = "Group".id
    WHERE "Lesson".id = ${lessonId};`;

  return students;
};

export const getAllGroups = async () => {
  const groups = await prisma.$queryRaw<Group[]>`SELECT * FROM public."Group";`;
  return groups;
};

export const getAllSubjects = async () => {
  const subjects = await prisma.$queryRaw<
    Subject[]
  >`SELECT * FROM public."Subject";`;
  return subjects;
};

export const getAllTeachers = async () => {
  const teachers = await prisma.$queryRaw<
    Teacher[]
  >`SELECT * FROM public."Teacher";`;
  return teachers;
};

export const createTeacher = async (teacher: CreateTeacher) => {
  const newTeacher = await prisma.$executeRaw`INSERT INTO public."Teacher"(
    "name", "surname", "degree")
    VALUES (${teacher.name}, ${teacher.surname}, ${teacher.degree});`;
};

export const getTeacherById = async (id: number) => {
  const teachers = await prisma.$queryRaw<
    Teacher[]
  >`SELECT * FROM public."Teacher" WHERE id = ${id};`;

  if (teachers.length === 1) return teachers[0];
};

export const updateTeacher = async (teacher: UpdateTeacher) => {
  const updateTeacherResult = await prisma.$executeRaw`UPDATE public."Teacher"
	SET "name"=${teacher.name}, "surname"=${teacher.surname}, "degree"=${teacher.degree}
	WHERE id = ${teacher.id};`;
};

export const deleteTeacher = async (teacherId: number) => {
  const deleteLessonResult =
    await prisma.$executeRaw`DELETE FROM public."Teacher"
	WHERE id = ${teacherId};`;
};
