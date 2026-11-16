<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Enviromental_Surveys.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carousel Start -->
    <div class="header-carousel owl-carousel">
        <div class="header-carousel-item">
            <video class="img-fluid w-100" autoplay muted loop playsinline>
                <source src="assets/img/enviro-slider.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="carousel-caption">
                <div class="container">
                    <div class="row gy-0 gx-5">
                        <div class="col-lg-0 col-xl-5"></div>
                        <div class="col-xl-7 animated fadeInLeft">
                            <div class="text-sm-center text-md-end">
                                <h4 class="text-primary text-uppercase fw-bold mb-4">Welcome To Survey Portal</h4>
                                <h1 class="display-4 text-uppercase text-white mb-4">Protect Our Environment Together
                                </h1>
                                <p class="mb-5 fs-5">Participate in surveys and competitions to raise awareness about
                                    environmental protection
                                </p>
                                <div class="d-flex justify-content-center justify-content-md-end flex-shrink-0 mb-4">
                                    <a class="btn btn-primary rounded-pill py-3 px-4 px-md-5 ms-2" href="../Account/register.aspx">Participate
                                        Now</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-carousel-item">
            <video class="img-fluid w-100" autoplay muted loop playsinline>
                <source src="assets/img/enviro-slider.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="carousel-caption">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-12 animated fadeInUp">
                            <div class="text-center">
                                <h4 class="text-primary text-uppercase fw-bold mb-4">Welcome To Survey Portal</h4>
                                <h1 class="display-4 text-uppercase text-white mb-4">Your Voice Shapes the Future of Our
                                    Institution</h1>
                                <p class="mb-5 fs-5">Latest surveys and competitions are live! Registered users can
                                    participate and win exciting rewards.
                                </p>
                                <div class="d-flex justify-content-center flex-shrink-0 mb-4">
                                    <a class="btn btn-primary rounded-pill py-3 px-4 px-md-5 ms-2" href="../Account/register.aspx">Participate
                                        Now</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->

   



    <!-- About Start -->
    <div class="container-fluid about py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-xl-7 wow fadeInLeft" data-wow-delay="0.2s">
                    <div>
                        <h4 class="text-primary">About Portal</h4>
                        <h1 class="display-5 mb-4">Welcome to the Environmental Survey System</h1>
                        <p class="mb-4">
                            This portal is designed for <b>Students, Faculty, and Staff</b> of our institution to
                            participate in surveys, share their effective contributions, and take part in competitions.
                            Only registered and approved users can access surveys.
                        </p>
                        <a href="survey-board.aspx" class="btn btn-primary rounded-pill py-3 px-5">Go to Survey
                            Board</a>
                    </div>
                </div>
                <div class="col-xl-5 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="bg-primary rounded position-relative overflow-hidden">
                        <img src="assets/img/about.jpg" alt="Environmental Survey" height="300px">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- Surveys Overview Start -->
    <div class="container-fluid service pb-5">
        <div class="container pb-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-primary">Surveys Overview</h4>
                <h1 class="display-5 mb-4">Latest & Ongoing Surveys</h1>
                <p class="mb-0">Browse the most recent surveys conducted for students, faculty, and staff.
                    You must be logged in to participate.</p>
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
            </div>
        </div>
    </div>
    <!-- Surveys Overview End -->


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


    <!-- Survey Highlights & News Start -->
    <div class="container-fluid blog pb-5 pt-5">
        <div class="container pb-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-primary">Survey Highlights</h4>
                <h1 class="display-5 mb-4">Latest News & Activities</h1>
                <p class="mb-0">Stay updated with the most recent surveys, environmental activities, and competition
                    announcements.</p>
            </div>
            <div class="owl-carousel blog-carousel wow fadeInUp" data-wow-delay="0.2s">

                <!-- News Item -->
                <div class="blog-item p-4">
                    <div class="blog-img mb-4">
                        <img src="assets/img/survey-news1.jpg" class="img-fluid w-100 rounded" alt="">
                        <div class="blog-title">
                            <a href="#" class="btn">Survey Update</a>
                        </div>
                    </div>
                    <a href="#" class="h4 d-inline-block mb-3">Campus Environmental Survey Completed</a>
                    <p class="mb-4">Over 500 students participated in the campus waste management survey with valuable
                        suggestions...</p>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-user-shield fa-2x text-primary"></i>
                        <div class="ms-3">
                            <h5>Admin</h5>
                            <p class="mb-0">September 2025</p>
                        </div>
                    </div>
                </div>

                <!-- News Item -->
                <div class="blog-item p-4">
                    <div class="blog-img mb-4">
                        <img src="assets/img/survey-news2.jpg" class="img-fluid w-100 rounded" alt="">
                        <div class="blog-title">
                            <a href="#" class="btn">Competition</a>
                        </div>
                    </div>
                    <a href="#" class="h4 d-inline-block mb-3">Green Campus Challenge Announced</a>
                    <p class="mb-4">A new competition on eco-friendly initiatives will be held on 15th September.
                        Register now!</p>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-user-shield fa-2x text-primary"></i>
                        <div class="ms-3">
                            <h5>Admin</h5>
                            <p class="mb-0">September 2025</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Survey Highlights & News End -->


    <!-- Effective Participation Start -->
    <div class="container-fluid py-5 bg-light">
        <div class="container py-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-primary">Effective Participation</h4>
                <h1 class="display-5 mb-4">Impact of Our Surveys & Competitions</h1>
                <p class="mb-0">We believe in active participation. Here’s a quick look at how students, faculty, and
                    staff have contributed and benefited from our surveys and competitions.</p>
            </div>
            <div class="row g-4 text-center">
                <div class="col-md-3 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="bg-white rounded shadow p-4 h-100">
                        <h2 class="text-primary mb-2">25+</h2>
                        <p class="mb-0">Surveys Conducted</p>
                    </div>
                </div>
                <div class="col-md-3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="bg-white rounded shadow p-4 h-100">
                        <h2 class="text-primary mb-2">500+</h2>
                        <p class="mb-0">Active Participants</p>
                    </div>
                </div>
                <div class="col-md-3 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="bg-white rounded shadow p-4 h-100">
                        <h2 class="text-primary mb-2">10+</h2>
                        <p class="mb-0">Competitions Held</p>
                    </div>
                </div>
                <div class="col-md-3 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="bg-white rounded shadow p-4 h-100">
                        <h2 class="text-primary mb-2">15+</h2>
                        <p class="mb-0">Workshops & Seminars</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="../Account/register.aspx" class="btn btn-primary btn-lg rounded-pill px-5">Participate Now</a>
            </div>
        </div>
    </div>
    <!-- Effective Participation End -->


    <!-- Support Start -->
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-xl-6">
                    <div class="wow fadeInUp" data-wow-delay="0.2s">
                        <div class="bg-light rounded p-5 mb-5">
                            <h4 class="text-primary mb-4">Get in Touch</h4>
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <div class="contact-add-item">
                                        <div class="contact-icon text-primary mb-4">
                                            <i class="fas fa-map-marker-alt fa-2x"></i>
                                        </div>
                                        <div>
                                            <h4>Address</h4>
                                            <p class="mb-0">
                                                123 Site Center</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="contact-add-item">
                                        <div class="contact-icon text-primary mb-4">
                                            <i class="fas fa-envelope fa-2x"></i>
                                        </div>
                                        <div>
                                            <h4>Mail Us</h4>
                                            <p class="mb-0">admin@surveyportal.com</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="contact-add-item">
                                        <div class="contact-icon text-primary mb-4">
                                            <i class="fa fa-phone-alt fa-2x"></i>
                                        </div>
                                        <div>
                                            <h4>Telephone</h4>
                                            <p class="mb-0">(+92) 123 456
                                                7890</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="contact-add-item">
                                        <div class="contact-icon text-primary mb-4">
                                            <i class="fab fa-firefox-browser fa-2x"></i>
                                        </div>
                                        <div>
                                            <h4>Yoursite@ex.com</h4>
                                            <p class="mb-0">(+012) 3456 7890</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-light p-5 rounded h-100 wow fadeInUp" data-wow-delay="0.2s">
                            <h4 class="text-primary">Support Form</h4>
                            <p class="mb-4"> If you face any technical issues during registration, login, survey
                                participation,
                                or competition submission, please fill out this form.
                                Our support team will review your request and get back to you as soon as possible. </p>
                            <form>
                                <div class="row g-4">
                                    <div class="col-lg-12 col-xl-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control border-0" id="name"
                                                placeholder="Your Name">
                                            <label for="name">Your Name</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-xl-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control border-0" id="email"
                                                placeholder="Your Email">
                                            <label for="email">Your Email</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-xl-6">
                                        <div class="form-floating">
                                            <input type="phone" class="form-control border-0" id="phone"
                                                placeholder="Phone">
                                            <label for="phone">Your Phone</label>
                                        </div>
                                    </div>
                                    <!-- Issue Type -->
                                    <div class="col-lg-6">
                                        <div class="form-floating">
                                            <select class="form-select border-0" id="issueType">
                                                <option selected disabled>Select Issue Type</option>
                                                <option value="login">Login Issue</option>
                                                <option value="registration">Registration Issue</option>
                                                <option value="survey">Survey Submission Problem</option>
                                                <option value="technical">Technical Error</option>
                                                <option value="other">Other</option>
                                            </select>
                                            <label for="issueType">Issue Type</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control border-0" placeholder="Leave a message here"
                                                id="message" style="height: 160px"></textarea>
                                            <label for="message">Message</label>
                                        </div>

                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="rounded h-100">
                        <iframe class="rounded h-100 w-100" style="height: 400px;"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387191.33750346623!2d-73.97968099999999!3d40.6974881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1694259649153!5m2!1sen!2sbd"
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Support End -->


    <!-- FAQs Start -->
    <div class="container-fluid faq-section py-5">
        <div class="container py-5 overflow-hidden">
            <div class="text-center mx-auto pb-5 wow fadeInLeft" data-wow-delay="0.1s" style="max-width: 800px;">
                <h4 class="text-primary">FAQs</h4>
                <h1 class="display-5 mb-4">Frequently Asked Questions</h1>
                <p class="mb-0">Find answers to the most common questions about using the Environmental Survey Portal.
                </p>
            </div>
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeInLeft" data-wow-delay="0.1s">
                    <div class="accordion accordion-flush bg-light rounded p-5" id="accordionFlushSection">

                        <!-- Q1 -->
                        <div class="accordion-item rounded-top">
                            <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne">
                                    How to register for the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">Go to the Register page, fill in your name, roll no/employee
                                    no, class/section, and submit. The Admin must approve your registration before you
                                    can log in.</div>
                            </div>
                        </div>

                        <!-- Q2 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseTwo">
                                    How to participate in the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseTwo" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">Login to your dashboard, visit the Survey Board, and click
                                    on “Participate” for the active survey.</div>
                            </div>
                        </div>

                        <!-- Q3 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseThree">
                                    How will I be intimated with the new survey?
                                </button>
                            </h2>
                            <div id="flush-collapseThree" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">New surveys will appear on the Home page, Survey Board, and
                                    in your Dashboard notifications.</div>
                            </div>
                        </div>

                        <!-- Q4 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseFour">
                                    What if it gives an error after submitting the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseFour" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">If you face an error after clicking submit, contact Support
                                    immediately with your details. Our team will verify and assist you.</div>
                            </div>
                        </div>

                        <!-- Q5 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseFive">
                                    Why am I unable to participate in the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseFive" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">You cannot participate if you are not a registered user, or
                                    due to a technical problem. Please check your login status and internet connection.
                                </div>
                            </div>
                        </div>

                        <!-- Q6 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingSix">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseSix">
                                    Why is my registration request not accepted?
                                </button>
                            </h2>
                            <div id="flush-collapseSix" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">Your registration will be declined if the details you
                                    entered do not match the institution records.</div>
                            </div>
                        </div>

                        <!-- Q7 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingSeven">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseSeven">
                                    Will there be any benefit if I participate in the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseSeven" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">Yes! Active participants can win prizes, gain recognition,
                                    and contribute to environmental protection initiatives.</div>
                            </div>
                        </div>

                        <!-- Q8 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingEight">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseEight">
                                    How to participate in the competitions?
                                </button>
                            </h2>
                            <div id="flush-collapseEight" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">Competitions are listed on the Survey Board. Follow the
                                    instructions, participate in surveys, and top scorers will be announced.</div>
                            </div>
                        </div>

                        <!-- Q9 -->
                        <div class="accordion-item rounded-bottom">
                            <h2 class="accordion-header" id="flush-headingNine">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseNine">
                                    What if there are some arrears in participating the survey?
                                </button>
                            </h2>
                            <div id="flush-collapseNine" class="accordion-collapse collapse"
                                data-bs-parent="#accordionFlushSection">
                                <div class="accordion-body">If you miss a survey, you cannot participate after its
                                    deadline. Stay updated via notifications and check the Survey Board regularly.</div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-6 wow fadeInRight" data-wow-delay="0.1s">
                    <div class="bg-primary rounded">
                        <img src="assets/img/about-2.png" class="img-fluid w-100" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- FAQs End -->
   

</asp:Content>
