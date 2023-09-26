package com.songmin.song.controller;

import com.songmin.song.domain.UserDto;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//  UserDto를 검증하는 클래스
public class UserValidator implements Validator {

    //  검증하는 객체가 UserDto 클래스타입이 맞는지 확인
    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
//        return User.class.equals(clazz);   검증하려는 객체가 User타입인지 확인
    }

    //  UserDto 검증하기 - supports()가 true 일때만 실행
    @Override
    public void validate(Object target, Errors errors) {

//        //  (id, pwd, name, birth, email, phone)의 값이 null 이거나 공백일때 에러코드(required) 추가
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birth",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",  "required");

        //  검증하는 객체의 프로퍼티 가져오기
        UserDto user = (UserDto) target;
        String id = user.getId();
        String pwd = user.getPwd();
        String name = user.getName();
        String email = user.getEmail();
        String phone = user.getPhone();

        System.out.println("Validuser = " + user);


//      id 양식 - (영어 대소문자, 숫자)(6~12자리)
        String id_regx = "^[a-zA-Z0-9]{6,12}$";
        Pattern id_pattern = Pattern.compile(id_regx);
        Matcher id_matcher = id_pattern.matcher(id);
        if(!id_matcher.matches()) {
            errors.rejectValue("id", "typeMismatch", null);
        }

//      pwd 양식 - 최소 하나의 (영어 대소문자, 숫자, 특수문자)를 포함하고 최소 8글자 이어야함
        String pwd_regx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$";
        Pattern pwd_pattern = Pattern.compile(pwd_regx);
        Matcher pwd_matcher = pwd_pattern.matcher(pwd);
        if(!pwd_matcher.matches()) {
            errors.rejectValue("pwd", "typeMismatch", null);
        }

//      이름 양식 - 2~5 자리의 한글
        String name_regx = "^[가-힣]{2,5}$";
        Pattern name_pattern = Pattern.compile(name_regx);
        Matcher name_matcher = name_pattern.matcher(name);
        if(!name_matcher.matches()) {
            errors.rejectValue("name", "typeMismatch", null);
        }

//      이메일 양식 - (영어 대소문자, 숫자)(최소 한개 이상))  @  (영어 대소문자, 숫자, .-)(최소한개이상)  .  (2~6자리 영어 대소문자)
        String email_regx = "^[0-9a-zA-Z]+@[0-9a-zA-Z.-]+\\.[a-zA-Z]{2,6}$";
        Pattern email_pattern = Pattern.compile(email_regx);
        Matcher email_matcher = email_pattern.matcher(email);
        if(!email_matcher.matches()) {
            errors.rejectValue("email", "typeMismatch", null);
        }

//      휴대번호 양식 - (010, 011, 016, 017, 018, 019) + (3 or 4)자리 + (4)자리
        String phone_regx = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$";
        Pattern phone_pattern = Pattern.compile(phone_regx);
        Matcher phone_matcher = phone_pattern.matcher(phone);
        if(!phone_matcher.matches()) {
            errors.rejectValue("phone", "typeMismatch", null);
        }

    }
}
