class Appointment {
  final String appointmentId;
  final String patientName;
  final String contactNumber;
  final String reasonForAppointment;
  final String userId;
  final String doctorId;
  final DateTime createdAt;
  final String date;
  final String time;
  final String image;

  Appointment({
    required this.appointmentId,
    required this.patientName,
    required this.contactNumber,
    required this.reasonForAppointment,
    required this.userId,
    required this.doctorId,
    required this.createdAt,
    required this.date,
    required this.time,
    required this.image
  });

  factory Appointment.fromFirestore( doc) {
    Map data = doc.data() as Map;
    return Appointment(
      appointmentId: data['appoimnet_id'] ?? '',
      patientName: data['patient_name'] ?? '',
      contactNumber: data['contact_number'] ?? '',
      reasonForAppointment: data['reason_for_appointment'] ?? '',
      userId: data['user'] ?? '',
      doctorId: data['docter'] ?? '',
      createdAt: (data['created_at'] ).toDate(),
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
