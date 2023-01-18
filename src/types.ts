export type CommonLesson = {
  id: number;
  group: string;
  subject: string;
  tname: string;
  tsurname: string;
};

export type CreateLesson = {
  teacherId: number;
  groupId: number;
  subjectId: number;
};

export type UpdateLesson = CreateLesson & { id: number };

export type CreateTeacher = {
  name: string;
  surname: string;
  degree: string;
};

export type UpdateTeacher = CreateTeacher & {
  id: number;
};

export type Student = {
  name: string;
  surname: string;
  course: string;
};
