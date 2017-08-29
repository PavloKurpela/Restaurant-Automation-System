package com.mainacad.myproject.controler;

import java.util.HashMap;
import java.util.Map;

public class Ajax {

    public static Map<String, Object> successResponse(Object object) {
        Map<String, Object> resp = new HashMap<>();

        resp.put("result", "success");
        resp.put("data", object);
        return resp;
    }

    public static Map<String, Object> emptyResponse() {

        Map<String, Object> resp = new HashMap<>();

        resp.put("result", "success");
        return resp;
    }

    public static Map<String, Object> errorResponse(String errorMessage) {
        Map<String, Object> resp = new HashMap<String, Object>();
        resp.put("result", "error");
        resp.put("message", errorMessage);
        return resp;
    }

}
