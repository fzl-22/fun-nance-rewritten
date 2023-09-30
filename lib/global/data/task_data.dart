import 'package:fun_nance_rewritten/global/models/task.dart';

List<Task> taskData = [
  Task(
    title: "Membersihkan tempat tidur",
    childName: "Ahmad Mu'min Faisal",
    description:
        "Tempat tidurmu sendiri dibersihkan ya kak. Papa pergi ke tetangga dulu.",
    reward: 50,
    status: TaskStatus.notYet,
    deadline: DateTime.now().add(
      const Duration(days: 3),
    ),
  ),
  Task(
    title: "Menyiapkan pelajaran sekolah",
    childName: "Ahmad Mu'min Faisal",
    description:
        "Sekolah besok jangan lupa masukin pelajaran PKN dan Matematika yaa, kak.",
    reward: 75,
    status: TaskStatus.done,
    deadline: DateTime.now().add(
      const Duration(days: 3),
    ),
  ),
  Task(
    title: "Menjemur pakaian",
    childName: "Ahmad Mu'min Faisal",
    description:
        "Papa habis laundry tapi masih cuci basah. Kakak bantu jemurin ya? Hasil cuciannya ada di atas motor.",
    reward: 100,
    status: TaskStatus.done,
    deadline: DateTime.now().add(
      const Duration(days: 3),
    ),
  ),
  // Task(
  //   title: "Bersihkan kamar mandi",
  //   childName: "Ivan Sholana",
  //   description: "Bersihkan kamar mandinya ya kakak",
  //   reward: 5000,
  //   status: TaskStatus.done,
  //   deadline: DateTime.now().add(
  //     const Duration(days: 3),
  //   ),
  // ),
];
