package com.hsshy.beam.sys.controller;

import com.hsshy.beam.common.enumeration.RetEnum;
import com.hsshy.beam.common.exception.BeamException;
import com.hsshy.beam.common.util.OSSFactory;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ToolUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@Api(value="FileController",tags={"文件上传接口"})
@RestController
@RequestMapping("/file")
public class FileController {


    @ApiOperation(value = "文件上传")
    @PostMapping("/upload")
    public Object uploadFile(@RequestPart("file") MultipartFile file) {

        String fileName = UUID.randomUUID().toString() + "." + ToolUtil.getFileSuffix(file.getOriginalFilename());
        try {
            String url = OSSFactory.build().upload(file.getBytes(),fileName);
            return R.ok(url);

        } catch (Exception e) {
            e.printStackTrace();
            throw new BeamException(RetEnum.UPLOAD_ERROR);
        }

    }




}