<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Enviromental_Surveys.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">FAQs</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>

                <li class="breadcrumb-item active text-primary">FAQ</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->
    </div>
   



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
