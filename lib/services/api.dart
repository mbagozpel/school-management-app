int? id;

class Api {
  static String baseUrl = "http://127.0.0.1:8000/";

  // POST REQUEST
  static String loginUrl = "${baseUrl}login_user";
  static String logout = "${baseUrl}logout_user";
  static String addStaff = "${baseUrl}add_staff";
  static String addClass = "${baseUrl}add_class";
  static String addSubject = "${baseUrl}add_subject";
  static String addStudent = "${baseUrl}add_student";
  static String addSession = "${baseUrl}add_session";
  static String takeAttendanceData = "${baseUrl}take_attendance_data";
  static String staffAskPermission = "${baseUrl}staff_ask_permission";
  static String studentAskPermission = "${baseUrl}student_ask_permission";
  static String staffApprovePermission = "${baseUrl}staff_approve_permission";
  static String staffDisapprovePermission =
      "${baseUrl}staff_disapprove_permission";
  static String studentApprovePermission =
      "${baseUrl}student_approve_permission";
  static String studentDisApprovePermission =
      "${baseUrl}student_disapprove_permission";
  static String staffSendFeedback = "${baseUrl}staff_send_feedback";
  static String studentSendFeedback = "${baseUrl}student_send_feedback";
  static String staffFeedbackReplied = "${baseUrl}staff_feedback_replied";
  static String studentFeedbackReplied = "${baseUrl}student_feedback_replied";
  static String computeStudentResult = "${baseUrl}compute_student_result";

  //GET REQUEST
  static String getStaffs = "${baseUrl}get_staffs";
  static String getStudents = "${baseUrl}get_students";
  static String getClasses = "${baseUrl}get_classes";
  static String getSubjects = "${baseUrl}get_subjects";
  static String getSessions = "${baseUrl}get_sessions";
  static String getStaffFeedbacks = "${baseUrl}get_staff_feedbacks";
  static String getStudentFeedbacks = "${baseUrl}get_student_feedbacks";
  static String checkEmailExists = "${baseUrl}check_email_exists";
  static String checkUsernameExists = "${baseUrl}check_username_exists";
  static String getClassStudents = "${baseUrl}get_class_students";
  static String getAttendanceDates = "${baseUrl}get_attendance_dates";
  static String getTerms = "${baseUrl}get_terms";
  static String getStaffPermissionReport =
      "${baseUrl}get_staff_permission_report";
  static String getStudentPermissionReport =
      "${baseUrl}get_student_permission_report";
  static String studentFeedbacks = "${baseUrl}student_feedbacks";
  static String staffFeedbacks = "${baseUrl}staff_feedbacks";
  static String adminStaffPermissionView =
      "${baseUrl}admin_staff_permission_view";
  static String adminStudentPermissionView =
      "${baseUrl}admin_student_permission_view";

  //PUT REQUEST
  static String editStaff = "${baseUrl}edit_staff";
  static String editStudent = "${baseUrl}edit_student";
  static String editClass = "${baseUrl}edit_class/";
  static String editSubject = "${baseUrl}edit_subject/";
  static String updateAttendanceData = "${baseUrl}update_attendance_data";
  static String updateStudentProfile = "${baseUrl}update_student_profile";
  static String updateStaffProfile = "${baseUrl}update_staff_profile";

  //DELETE REQUEST
  static String deleteStaff = "${baseUrl}delete_staff/$id";
}
