package com.qms.inventory.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.code.service.CodeService;
import com.qms.common.service.ExcelService;
import com.qms.inventory.service.InventoryService;
import com.qms.inventory.vo.InventoryVO;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.util.Constant;
import com.qms.util.ExcelConstant;

@Controller
public class InventoryController {

    @Autowired
    InventoryService service;

    @Autowired
    CodeService codeService;

    @Autowired
    private ExcelService excelService;

    @RequestMapping("/inventory/list")
    public String inventorylist(Model model) throws Exception {
        model.addAttribute("baseYear", Constant.BASE_YEAR);
        return "inventory/inv01";
    }

    @RequestMapping("/inventory/searchlist")
    @ResponseBody
    public InventoryVO searchlist(@ModelAttribute("InventoryVO") InventoryVO vo) throws Exception {
        vo.setComGrpCd(Constant.UNIT_TYPE);
        vo.setInDt(vo.getInDtYear() + vo.getInDtMonth());

        int totalPage = service.selectTotalInvCount(vo);
        List<InventoryVO> list = service.selectInvList(vo);

        vo.setInvlist(list);
        vo.setTotal(totalPage);  // 총 데이터 수
        vo.setStartPage(vo.getStartPage());
        vo.setCurrentPage(vo.getCurrentPage());  // 현재 페이지

        return vo;
    }

    @RequestMapping("/inventory/getLocation")
    @ResponseBody
    public InventoryVO getLocation(@ModelAttribute("InventoryVO") InventoryVO vo) throws Exception {
        ComCodeVO cd = new ComCodeVO();
        vo.setComGrpCd(Constant.LOCATION);
        List<ComCodeVO> locationlist = codeService.selectGetdata(cd);

        InventoryVO invvo = new InventoryVO();
        invvo.setLocationlist(locationlist);

        return invvo;
    }

}