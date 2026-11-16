<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="survey-board.aspx.cs" Inherits="Enviromental_Surveys.survey_board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">Survey Board</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active text-primary">Survey Board</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->
   


    <!-- Survey Board Start -->
    <div class="container-fluid survey-board py-5">
        <div class="container py-5 ">
            <div class="text-center mx-auto pb-5 wow fadeInLeft" data-wow-delay="0.1s" style="max-width: 900px;">
                <h4 class="text-primary">Survey Board</h4>
                <h1 class="display-5 mb-4">Participate in Surveys & Competitions</h1>
                <p class="mb-0">Explore the latest surveys and competitions organized for students, faculty, and staff.
                    Click "Participate" to join any survey or competition.</p>
            </div>

            <div class="row g-4">
                <!-- Survey 1 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="assets/img/Survey-1.png" alt="" width="310px" height="220px">
                        <h4 class="mb-2 pt-3">Environmental Awareness Survey</h4>
                        <p>Share your opinions on sustainability practices and environmental awareness initiatives on
                            campus. Help us improve our green programs and community outreach.</p>
                        <p><strong>Deadline:</strong> 10 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 2 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.2s">
                        <img src="assets/img/survey-2.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-5 pt-5">Student Feedback Survey</h4>
                        <p>Provide feedback about courses, faculty, and campus facilities to improve the learning
                            experience.</p>
                        <p><strong>Deadline:</strong> 15 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 3 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.3s">
                        <img src="assets/img/survey-3.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-4 pt-5">Faculty Seminar Participation</h4>
                        <p>Faculty/staff log seminar/workshop participation with details like location, participants,
                            and summary.</p>
                        <p><strong>Deadline:</strong> 20 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 4 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="assets/img/survey-4.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-5">Campus Safety Survey</h4>
                        <p>Help improve campus safety by providing feedback on facilities, security measures, and
                            overall practices.</p>
                        <p><strong>Deadline:</strong> 22 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 5 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.2s">
                        <img src="assets/img/survey-5.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-5">Library Services Feedback</h4>
                        <p>Provide feedback about library services, digital resources, and study environment to help
                            improve campus learning.</p>
                        <p><strong>Deadline:</strong> 25 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 6 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.3s">
                        <img src="assets/img/survey-6.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-5">Alumni Feedback Survey</h4>
                        <p>Alumni can share insights and experiences to help improve current curriculum and campus
                            facilities.</p>
                        <p><strong>Deadline:</strong> 28 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 7 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="assets/img/survey-7.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-5">Technology Use in Classroom</h4>
                        <p>Provide feedback on technology integration in lectures, labs, and seminars to improve
                            learning methods.</p>
                        <p><strong>Deadline:</strong> 30 Sep, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 8 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.2s">
                        <img src="assets/img/survey-8.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-5 ">Mental Health Awareness Survey</h4>
                        <p>Help us understand mental health needs on campus and ways to provide better support to
                            students and staff.</p>
                        <p><strong>Deadlipt-5ne:</strong> 05 Oct, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>

                <!-- Survey 9 -->
                <div class="col-md-6 col-lg-4">
                    <div class="survey-item rounded shadow p-4 wow fadeInUp" data-wow-delay="0.3s">
                        <img src="assets/img/survey-9.jpg" alt="" width="310px" height="220px">
                        <h4 class="mb-3 pt-4" pt-5>Campus Sustainability Initiatives</h4>
                        <p>Participate in this survey to provide suggestions on recycling, energy efficiency, and other
                            sustainability practices.</p>
                        <p><strong>Deadline:</strong> 10 Oct, 2025</p>
                        <a href="../Account/register.aspx" class="btn btn-primary rounded-pill py-2 px-4">Participate</a>
                    </div>
                </div>
            </div>

            <!-- Competitions Start -->
            <div class="container-fluid service py-5">
                <div class="container py-5">
                    <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                        <h4 class="text-primary">Competitions</h4>
                        <h1 class="display-5 mb-4">Upcoming Events & Challenges</h1>
                        <p class="mb-0">Participate in exciting competitions to showcase your ideas on environmental
                            sustainability.</p>
                    </div>
                    <div class="row g-4">
                        <!-- Competition 1 -->
                        <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="service-item bg-light rounded p-4 h-100">
                                <div class="service-icon mb-4">
                                    <i class="fas fa-leaf fa-3x text-primary"></i>
                                </div>
                                <h4 class="mb-3">Green Campus Challenge</h4>
                                <p class="mb-3">Encouraging eco-friendly practices across campus. Event Date: 15th
                                    September 2025.</p>
                                <a href="../Account/register.aspx" class="btn btn-primary">Register Now</a>
                            </div>
                        </div>
                        <!-- Competition 2 -->
                        <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.4s">
                            <div class="service-item bg-light rounded p-4 h-100">
                                <div class="service-icon mb-4">
                                    <i class="fas fa-recycle fa-3x text-primary"></i>
                                </div>
                                <h4 class="mb-3">Recycling Innovation Contest</h4>
                                <p class="mb-3">Present your creative recycling solutions. Event Date: 20th September
                                    2025.</p>
                                <a href="../Account/register.aspx" class="btn btn-primary">Register Now</a>
                            </div>
                        </div>
                        <!-- Competition 3 (New One) -->
                        <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.6s">
                            <div class="service-item bg-light rounded p-4 h-100">
                                <div class="service-icon mb-4">
                                    <i class="fas fa-solar-panel fa-3x text-primary"></i>
                                </div>
                                <h4 class="mb-3">Solar Energy Innovation</h4>
                                <p class="mb-3">Share ideas for clean and renewable solar energy. Event Date: 25th
                                    September 2025.</p>
                                <a href="../Account/register.aspx" class="btn btn-primary">Register Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Competitions End -->
            <!-- Past Winners Section -->
            <div class="text-center mx-auto pt-5 pb-4 wow fadeInLeft" data-wow-delay="0.1s" style="max-width: 900px;">

                <h1 class="display-5 mb-4">Past Winners</h1>

            </div>

            <div class="row g-4">
                <!-- Winner Item 1 -->
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="winner-item rounded shadow p-4  text-center">
                        <img src="assets/img/team-1.jpg" alt="" width="150px" height="150px">
                        <h5 class="mb-1 p-4">Ali Khan</h5>
                        <p class="mb-0">Science Quiz Winner - 2024</p>
                    </div>
                </div>

                <!-- Winner Item 2 -->
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="winner-item rounded shadow p-4 text-center">
                        <img src="assets/img/team-2.jpg" alt="" width="150px" height="150px">
                        <h5 class="mb-1 pt-5">Sara Ahmed</h5>
                        <p class="mb-0">Art & Design Contest Winner - 2024</p>
                    </div>
                </div>

                <!-- Winner Item 3 -->
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="winner-item rounded shadow p-4 text-center">
                        <img src="assets/img/team-3.jpg" alt="" width="150px" height="150px">
                        <h5 class="mb-1 pt-4">Hassan Ali</h5>
                        <p class="mb-0">Environmental Survey Top Contributor - 2024</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Survey Board End -->


</asp:Content>
