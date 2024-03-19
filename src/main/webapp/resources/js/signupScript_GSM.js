function handleFormSubmission() {
    // 여기에 모든 유효성 검사가 통과된 후 실행되어야 할 작업을 추가하세요.
    // 예를 들어, 회원가입 처리를 수행하거나 다음 단계로 이동하는 등의 작업을 수행할 수 있습니다.
    alert("모든 유효성 검사가 통과되었습니다. 회원가입을 처리합니다.");
   
}

$(document).ready(function() {
    $('#submit_Btn').click(function(event) {
        event.preventDefault(); // 기본 제출 동작 막기

        var agreementChecked = $('#check_agreement').is(':checked');
        if (!agreementChecked) {
            alert("개인정보 수집, 이용에 동의해주세요.");
            return;
        }

        var id = $('#input_id').val();
        var idCheck = $('#input_idCheck').val();
        var password = $('#input_pwd').val();
        var confirmPassword = $('#input_pwdcheck').val();
        var name = $('#input_name').val();
        var phoneNumber = $('#input_phone').val();
        var residentRegistrationNumber = $('#input_residentRegistrationNumber').val();
        
        console.log(id);
        console.log(idCheck);

        if (id !== idCheck) {
            alert("아이디 중복확인 안되었습니다 중복확인 버튼을 눌려주세요");
            return;
        }

        var idRegex = /^[a-zA-Z0-9]+$/;
        if (!idRegex.test(id)) {
            alert("아이디는 영문자와 숫자만 입력 가능합니다.");
            return;
        }
        
        // 비밀번호 유효성 검사: 영문자, 숫자, 특수문자 포함, 8자 이상
        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
        if (!passwordRegex.test(password)) {
            alert("비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
            return;
        }

        // 비밀번호와 비밀번호 확인 일치 여부 검사
        if (password !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }

        // 이름 유효성 검사: 한글만 허용
        var nameRegex = /^[가-힣]+$/;
        if (!nameRegex.test(name)) {
            alert("이름은 한글만 입력 가능합니다.");
            return;
        }

        // 전화번호 유효성 검사: 010 또는 02로 시작하는 10~11자리 숫자
        var phoneNumberRegex = /^(02|010)-\d{3,4}-\d{4}$/;
        if (!phoneNumberRegex.test(phoneNumber)) {
            alert("전화번호는 010 또는 02로 시작하는 10~11자리의 숫자이어야 합니다.");
            return;
        }

        // 주민등록번호 유효성 검사: 6자리 숫자-7자리 숫자 형식
        var residentRegistrationNumberRegex = /^\d{6}-\d{7}$/;
        if (!residentRegistrationNumberRegex.test(residentRegistrationNumber)) {
            alert("주민등록번호 형식이 올바르지 않습니다. 예) 123456-1234567");
            return;
        }

        
    });
});