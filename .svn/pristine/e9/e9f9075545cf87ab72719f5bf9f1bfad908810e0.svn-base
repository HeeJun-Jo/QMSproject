package com.qms.common.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.qms.common.dao.ExcelDao;
import com.qms.plan.vo.PlanInfoVO;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class ExcelService {
	
	@Autowired
	ExcelDao dao;

    public Workbook downloadExcel(HttpServletResponse response, Map<String, List<?>> dataMap, String fileName, Map<String, Map<String, String>> headerMap) throws Exception {
        try (Workbook workbook = new XSSFWorkbook()) {
            for (Map.Entry<String, List<?>> entry : dataMap.entrySet()) {
                String sheetName = entry.getKey();
                List<?> dataList = entry.getValue();
                Sheet sheet = workbook.createSheet(sheetName);

                if (!dataList.isEmpty()) {
                    // 헤더 생성
                    createHeaderRow(sheet, headerMap.get(sheetName));

                    // 데이터 행 생성
                    for (int rowNum = 0; rowNum < dataList.size(); rowNum++) {
                        createCellRow(sheet, dataList.get(rowNum), rowNum + 1, headerMap.get(sheetName));
                    }
                }
            }

            // 파일 다운로드를 위한 설정
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

            // 파일 스트림을 응답에 쓰기
            try (ServletOutputStream outputStream = response.getOutputStream()) {
                workbook.write(outputStream);
                response.flushBuffer();
            }
            return workbook;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void createHeaderRow(Sheet sheet, Map<String, String> headerMap) {
        Row headerRow = sheet.createRow(0);
        int cellIndex = 0;
        for (String header : headerMap.values()) {
            headerRow.createCell(cellIndex++).setCellValue(header);
        }
    }

    private void createCellRow(Sheet sheet, Object object, int rowNum, Map<String, String> headerMap) throws Exception {
        Row cellRow = sheet.createRow(rowNum);

        if (object instanceof HashMap) {
            int cellIndex = 0;
            for (String key : headerMap.keySet()) {
                Object value = ((HashMap<String, String>) object).get(key);
                cellRow.createCell(cellIndex++).setCellValue(value != null ? value.toString() : "");
            }
        } else {  // object vo일 경우
            Field[] fields = object.getClass().getDeclaredFields();
            Map<String, Object> fieldValues = new HashMap<>();
            for (Field field : fields) {
                field.setAccessible(true);
                fieldValues.put(field.getName(), field.get(object));
            }
            int cellIndex = 0;
            for (String key : headerMap.keySet()) {
                Object value = fieldValues.get(key);
                cellRow.createCell(cellIndex++).setCellValue(value != null ? value.toString() : "");
            }
        }
    }
    
    public ResponseEntity<byte[]> createExcelFile(List<Map<String, Object>> dataList, String[] columns, String[] headers, String filenName, String sheetName) {
        try {
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet(sheetName); // 시트 이름 설정

            // Header
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            CellStyle headerCellStyle = workbook.createCellStyle();
            headerCellStyle.setFont(headerFont);
            Row headerRow = sheet.createRow(0);
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
                cell.setCellStyle(headerCellStyle);
            }

            // Data
            int rowNum = 1;
            for (Map<String, Object> data : dataList) {
                Row row = sheet.createRow(rowNum++);
                int cellNum = 0;
                for (String column : columns) {
                    Object value = data.get(column);
                    row.createCell(cellNum++).setCellValue(value != null ? value.toString() : "");
                }
            }

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            workbook.write(out);
            workbook.close();

            byte[] excelBytes = out.toByteArray();

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            responseHeaders.setContentDispositionFormData("attachment", filenName);
            responseHeaders.setContentLength(excelBytes.length);

            return ResponseEntity.ok()
                    .headers(responseHeaders)
                    .body(excelBytes);
          } 
     catch (IOException e) {
            e.printStackTrace();
            return null; // Error handling
          }

    }
    
    public List<Map<String, Object>> selectReceiveListTOexcel(Map<String, Object> parameters) throws Exception {
        return dao.selectReceiveListTOexcel(parameters);
    }
    // 계획/주문수량 엑셀
    public List<Map<String, Object>> selectQtyToExcel(PlanInfoVO vo) throws Exception {
        return dao.selectQtyToExcel(vo);
    }
    // 계획수량 엑셀
    public List<Map<String, Object>> selectPlanQtyToExcel(PlanInfoVO vo) throws Exception {
        return dao.selectPlanQtyToExcel(vo);
    }
}
