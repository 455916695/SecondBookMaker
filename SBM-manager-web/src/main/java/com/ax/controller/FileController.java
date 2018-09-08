package com.ax.controller;

import com.ax.utils.JsonUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
/**
 * 测试文件上传用的controller
 *
 * */
@Controller
public class FileController {

    /**
     * 上传图片
     *
     * */
    @RequestMapping(value = "/pic/upload", produces= MediaType.TEXT_PLAIN_VALUE+";charset=utf-8")
    @ResponseBody
    public String uploadFile(MultipartFile uploadFile) {
        //由于没有图片服务器，所以将图片的内容上传工程中

        //创建流对象
        try {
            //取文件扩展名
            String originalFilename = uploadFile.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            //文件地址
            StringBuilder url = new StringBuilder();
            url.append("D://file//photo//").append( UUID.randomUUID()).append(".").append(extName);
            BufferedOutputStream  outputStream = new BufferedOutputStream( new FileOutputStream(new File(url.toString())));
            outputStream.write(uploadFile.getBytes());

            outputStream.close();

            //封装到map中返回
            Map result = new HashMap<>();
            result.put("error", 0);
            result.put("url", url);
            return JsonUtils.objectToJson(result);

        } catch ( Exception e) {
            e.printStackTrace();
            Map result = new HashMap<>();
            result.put("error", 1);
            result.put("message", "图片上传失败");
            return JsonUtils.objectToJson(result);
        }

    }


}
