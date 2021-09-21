class Api {
  static String get baseUrl {
    return "http://127.0.0.1:8000/";
  }

  // POST REQUEST
  static const login = "login_user";
  static const logout = "logout_user";
  static const addStaff = "add_staff";
  static const addClass = "add_class";
  static const addSubject = "add_subject";
  static const addStudent = "add_student";
  static const addSession = "add_session";
  static const takeAttendanceData = "tale_attendance_data";
  static const staffAskPermission = "staff_ask_permission";
  static const studentAskPermission = "student_ask_permission";
  static const staffApprovePermission = "staff_approve_permission";
  static const staffDisapprovePermission = "staff_disapprove_permission";
  static const studentApprovePermission = "student_approve_permission";
  static const studentDisApprovePermission = "student_disapprove_permission";
  static const staffSendFeedback = "staff_send_feedback";
  static const studentSendFeedback = "student_send_feedback";
  static const staffFeedbackReplied = "staff_feedback_replied";
  static const studentFeedbackReplied = "student_feedback_replied";
  static const computeStudentResult = "compute_student_result";

  //GET REQUEST
  static const getStaffs = "get_staffs";
  static const getStudents = "get_students";
  static const getClasses = "get_classes";
  static const getSubjects = "get_subjects";
  static const getSessions = "get_sessions";
  static const getStaffFeedbacks = "get_staff_feedbacks";
  static const getStudentFeedbacks = "get_student_feedbacks";
  static const checkEmailExists = "check_email_exists";
  static const checkUsernameExists = "check_username_exists";
  static const getClassStudents = "get_class_students";
  static const getAttendanceDates = "get_attendance_dates";
  static const getStaffPermissionReport = "get_staff_permission_report";
  static const getStudentPermissionReport = "get_student_permission_report";
  static const studentFeedbacks = "student_feedbacks";
  static const staffFeedbacks = "staff_feedbacks";
  static const adminStaffPermissionView = "admin_staff_permission_view";
  static const adminStudentPermissionView = "admin_student_permission_view";

  //PUT REQUEST
  static const editStaff = "edit_staff";
  static const editStudent = "edit_student";
  static const editClass = "edit_class/";
  static const editSubject = "edit_subject/";
  static const updateAttendanceData = "update_attendance_data";
  static const updateStudentProfile = "update_student_profile";
  static const updateStaffProfile = "update_staff_profile";
}
