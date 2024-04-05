<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DCSC</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
        body {
            min-height: 100vh;

            background: -webkit-gradient(linear, left bottom, right top, from(#d1ffd2), to (#d1ffd2));
            background: -webkit-linear-gradient(bottom left, #d1ffd2 0%, #d1ffd2 100%);
            background: -moz-linear-gradient(bottom left, #d1ffd2 0%, #d1ffd2 100%);
            background: -o-linear-gradient(bottom left, #d1ffd2 0%, #d1ffd2 100%);
            background: linear-gradient(to top right, #d1ffd2 0%, #d1ffd2 100%);
        }

        .input-form {
            max-width: 680px;

            margin-top: 80px;
            padding: 32px;

            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
        
        p {
        	font-size: 20px;
        	color: white
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">회원가입</h4>
                <form class="validation-form" novalidate method="post" action="signUpOk.jsp">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder=" 이름을 입력해주세요."
                                value="" required>
                            <div class="invalid-feedback">
                                이름을 입력해주세요.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="studentNumber">학번</label>
                            <input type="text" class="form-control" id="studentNumber" name="studentNumber" placeholder="학번을 입력해주세요."
                                value="" required>
                            <div class="invalid-feedback">
                                학번을 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="pwd">비밀번호</label>
                        <input type="text" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요." required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                        <div class="invalid-feedback">
                            이메일을 입력해주세요.
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-8 mb-3">
                            <label for="root">학년</label>
                            <select class="custom-select d-block w-100" id="root" name="grade" required
                                aria-label="select example">
                                <option value="">학년을 선택해주세요.</option>
                                <option value="1학년">1학년</option>
                                <option value="2학년">2학년</option>
                                <option value="교수">교수</option>
                                <option value="조교">조교</option>
                            </select>
                            <div class="invalid-feedback">
                                학년을 선택해주세요.
                            </div>
                            <br>
                            <label for="root">직책</label>
                            <select class="custom-select d-block w-100" id="root" name="position" required
                                aria-label="select example">
                                <option value="">직책을 선택해주세요.</option>
                                <option value="재학생">재학생</option>
                                <option value="휴학생">휴학생</option>
                                <option value="졸업생">졸업생</option>
                                <option value="교수">교수</option>
                                <option value="조교">조교</option>
                            </select>
                            <div class="invalid-feedback">
                                학년을 선택해주세요.
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aggrement" required>
                        <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                    </div>
                    <div class="mb-4"></div>
                    <button class="btn btn-primary btn-lg btn-primary bg-gradient" type="submit">가입 완료</button>
                    <button class="btn btn-primary btn-lg btn-danger bg-gradient" type="button"
                        onclick="location.href='index.jsp'">취소</button>
                </form>
            </div>
        </div>
        <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; 2023 청춘개발자</p>
        </footer>
    </div>
    <script>
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    </script>
</body>