package com.songmin.song.controller;

import com.songmin.song.domain.UserDto;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GlobalValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
//        return User.class.equals(clazz);   검증하려는 객체가 User타입인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birth",  "required");


        UserDto user = (UserDto) target;
        String id = user.getId();
        String pwd = user.getPwd();
        String name = user.getName();
        String email = user.getEmail();


        if((0<id.length() && id.length()<6) || id.length()>12) {
            errors.rejectValue("id", "invalidLength", new String[]{"6","12"}, null);
        }
        if((0<pwd.length() && pwd.length()<6) || pwd.length()>12) {
            errors.rejectValue("pwd", "invalidLength", new String[]{"6","12"}, null);
        }
        if(name.length()==1 || name.length()>4) {
            errors.rejectValue("name", "invalidLength", new String[]{"2","4"}, null);
        }


        String regx = "^(.+)@(.+)$";
        Pattern pattern = Pattern.compile(regx);
        Matcher matcher = pattern.matcher(email);
        if(!matcher.matches()) {
            errors.rejectValue("email", "typeMismatch", null);
        }

    }
}
