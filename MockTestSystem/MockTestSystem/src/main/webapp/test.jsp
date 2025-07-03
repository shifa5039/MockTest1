<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Test</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fefefe;
            margin: 20px;
        }

        .question-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #f7f7f7;
            border-radius: 12px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
        }

        .question {
            display: none;
        }

        .question.active {
            display: block;
        }

        .question-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .navigation-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        button, input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007acc;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #005a99;
        }

        .timer-iframe {
            position: fixed;
            top: 20px;
            right: 20px;
            border: none;
            width: 180px;
            height: 80px;
        }
    </style>
</head>
<body>

    <!-- Load timer.html in iframe -->
    <iframe src="timer.html" class="timer-iframe"></iframe>

    <div class="question-container">
        <h2>Answer the Questions</h2>
        <form id="testForm" action="SubmitTestServlet" method="post">
            
            <!-- Question 1 -->
            <div class="question active">
                <p><b>Q1:</b> What is Java?</p>
                <input type="radio" name="q1" value="A"> Language<br>
                <input type="radio" name="q1" value="B"> OS<br>
                <input type="radio" name="q1" value="C"> Browser<br>
                <input type="radio" name="q1" value="D"> App<br>
            </div>

            <!-- Question 2 -->
            <div class="question">
                <p><b>Q2:</b> What does JVM stand for?</p>
                <input type="radio" name="q2" value="A"> Java Variable Machine<br>
                <input type="radio" name="q2" value="B"> Java Virtual Machine<br>
                <input type="radio" name="q2" value="C"> Java Visual Method<br>
                <input type="radio" name="q2" value="D"> Java Value Manager<br>
            </div>

            <!-- Question 3 -->
            <div class="question">
                <p><b>Q3:</b> Which keyword is used to inherit a class in Java?</p>
                <input type="radio" name="q3" value="A"> import<br>
                <input type="radio" name="q3" value="B"> implement<br>
                <input type="radio" name="q3" value="C"> extends<br>
                <input type="radio" name="q3" value="D"> inherit<br>
            </div>

            <!-- Add more questions similarly -->
            <div class="question">
                <p><b>Q4:</b> What is the extension of Java compiled files?</p>
                <input type="radio" name="q4" value="A"> .java<br>
                <input type="radio" name="q4" value="B"> .class<br>
                <input type="radio" name="q4" value="C"> .exe<br>
                <input type="radio" name="q4" value="D"> .txt<br>
            </div>

            <div class="question">
                <p><b>Q5:</b> Which of the following is not a Java feature?</p>
                <input type="radio" name="q5" value="A"> Object Oriented<br>
                <input type="radio" name="q5" value="B"> Use of pointers<br>
                <input type="radio" name="q5" value="C"> Portable<br>
                <input type="radio" name="q5" value="D"> Robust<br>
            </div>

            <div class="question">
                <p><b>Q6:</b> Which method is the entry point in a Java program?</p>
                <input type="radio" name="q6" value="A"> start()<br>
                <input type="radio" name="q6" value="B"> init()<br>
                <input type="radio" name="q6" value="C"> main()<br>
                <input type="radio" name="q6" value="D"> run()<br>
            </div>

            <div class="question">
                <p><b>Q7:</b> Which package contains the Scanner class?</p>
                <input type="radio" name="q7" value="A"> java.util<br>
                <input type="radio" name="q7" value="B"> java.io<br>
                <input type="radio" name="q7" value="C"> java.lang<br>
                <input type="radio" name="q7" value="D"> java.net<br>
            </div>

            <div class="question">
                <p><b>Q8:</b> Which of the following is used to handle exceptions?</p>
                <input type="radio" name="q8" value="A"> catch<br>
                <input type="radio" name="q8" value="B"> try-catch<br>
                <input type="radio" name="q8" value="C"> final<br>
                <input type="radio" name="q8" value="D"> throw-catch<br>
            </div>

            <div class="question">
                <p><b>Q9:</b> What is used to create a new object in Java?</p>
                <input type="radio" name="q9" value="A"> this<br>
                <input type="radio" name="q9" value="B"> new<br>
                <input type="radio" name="q9" value="C"> malloc<br>
                <input type="radio" name="q9" value="D"> alloc<br>
            </div>

            <div class="question">
                <p><b>Q10:</b> Java is a...</p>
                <input type="radio" name="q10" value="A"> low-level language<br>
                <input type="radio" name="q10" value="B"> high-level language<br>
                <input type="radio" name="q10" value="C"> assembly language<br>
                <input type="radio" name="q10" value="D"> scripting language<br>
            </div>

            <div class="navigation-buttons">
                <button type="button" id="prevBtn" disabled>Previous</button>
                <button type="button" id="nextBtn">Next</button>
                <input type="submit" id="submitBtn" style="display: none;" value="Submit Test">
            </div>
        </form>
    </div>

    <script>
        const questions = document.querySelectorAll(".question");
        const nextBtn = document.getElementById("nextBtn");
        const prevBtn = document.getElementById("prevBtn");
        const submitBtn = document.getElementById("submitBtn");
        let current = 0;

        function showQuestion(index) {
            questions.forEach((q, i) => {
                q.classList.toggle("active", i === index);
            });
            prevBtn.disabled = index === 0;
            nextBtn.style.display = index < questions.length - 1 ? "inline-block" : "none";
            submitBtn.style.display = index === questions.length - 1 ? "inline-block" : "none";
        }

        nextBtn.addEventListener("click", () => {
            if (current < questions.length - 1) {
                current++;
                showQuestion(current);
            }
        });

        prevBtn.addEventListener("click", () => {
            if (current > 0) {
                current--;
                showQuestion(current);
            }
        });

        showQuestion(current);
    </script>

</body>
</html>
