package shop.jamielee.springonintellij.domain;

import java.time.LocalDateTime;

public class Message {

    private String message;
    private LocalDateTime responseDate;

    public Message() {
        // empty constructor
    }
    public Message(String message) {
        this.message = message;
        this.responseDate = LocalDateTime.now();
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(LocalDateTime responseDate) {
        this.responseDate = responseDate;
    }
}
