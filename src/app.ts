import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";
import path from "path";
import Handlebars from "hbs";
import {
  createLesson,
  createTeacher,
  deleteLesson,
  deleteTeacher,
  getAllGroups,
  getAllLessons,
  getAllSubjects,
  getAllTeachers,
  getLessonById,
  getTeacherById,
  getStudentsForLessonById,
  updateLesson,
  updateTeacher,
} from "./services";
import { CreateLesson, CreateTeacher } from "./types";
import { engine } from "express-handlebars";

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.use(express.urlencoded({ extended: false }));
app.use("/static", express.static(__dirname + "/public"));

app.engine(
  "hbs",
  engine({
    layoutsDir: path.join(__dirname, "views/layouts"),
    defaultLayout: "layout",
    extname: "hbs",
    helpers: {
      isEqual(value1: any, value2: any) {
        return value1 === value2;
      },
    },
  })
);

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");

app.get("/", async (req: Request, res: Response) => {
  const lessons = await getAllLessons();
  res.render("lesson/list", { lessons });
});

app.get("/lesson/:id/edit", async (req: Request, res: Response) => {
  if (!req.params.id) return;

  const lesson = await getLessonById(Number.parseInt(req.params.id));
  const groups = await getAllGroups();
  const subjects = await getAllSubjects();
  const teachers = await getAllTeachers();
  res.render("lesson/edit", { lesson, groups, subjects, teachers });
});

app.get("/lesson/create", async (req: Request, res: Response) => {
  const groups = await getAllGroups();
  const subjects = await getAllSubjects();
  const teachers = await getAllTeachers();
  res.render("lesson/create", { groups, subjects, teachers });
});

app.post("/lesson/create", async (req: Request, res: Response) => {
  const lesson: CreateLesson = {
    groupId: Number.parseInt(req.body.group),
    subjectId: Number.parseInt(req.body.subject),
    teacherId: Number.parseInt(req.body.teacher),
  };
  await createLesson(lesson);
  res.redirect(`/`);
});

app.post("/lesson/:id/edit", async (req: Request, res: Response) => {
  const lesson: CreateLesson = {
    groupId: Number.parseInt(req.body.group),
    subjectId: Number.parseInt(req.body.subject),
    teacherId: Number.parseInt(req.body.teacher),
  };

  const id = Number.parseInt(req.params.id);
  await updateLesson({ id, ...lesson });
  res.redirect(`back`);
});

app.get("/lesson/:id/delete", async (req: Request, res: Response) => {
  const id = Number.parseInt(req.params.id);
  await deleteLesson(id);
  res.redirect(`back`);
});

app.get("/teachers", async (req: Request, res: Response) => {
  const teachers = await getAllTeachers();
  res.render("teacher/list", { teachers });
});

app.get("/teacher/create", async (req: Request, res: Response) => {
  res.render("teacher/create");
});

app.post("/teacher/create", async (req: Request, res: Response) => {
  const teacher: CreateTeacher = { ...req.body };
  await createTeacher(teacher);
  res.redirect(`/teachers`);
});

app.get("/teacher/:id/edit", async (req: Request, res: Response) => {
  const teacher = await getTeacherById(Number.parseInt(req.params.id));
  res.render("teacher/edit", { teacher });
});

app.post("/teacher/:id/edit", async (req: Request, res: Response) => {
  const teacher: CreateTeacher = { ...req.body };
  const id = Number.parseInt(req.params.id);

  await updateTeacher({ id, ...teacher });
  res.redirect(`/teachers`);
});

app.get("/teacher/:id/delete", async (req: Request, res: Response) => {
  const id = Number.parseInt(req.params.id);
  await deleteTeacher(id);
  res.redirect(`back`);
});

app.get("/lesson/:id/students", async (req: Request, res: Response) => {
  const id = Number.parseInt(req.params.id);
  const students = await getStudentsForLessonById(id);
  res.render("lesson/students", { students });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
