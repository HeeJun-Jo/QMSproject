package com.qms.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class ExcelConstant {

    // ItemInfoVO에 대한 헤더 맵
    private static final Map<String, String> ITEM_HEADER_MAP = new LinkedHashMap<>();

    // BomExcelVO에 대한 헤더 맵
    private static final Map<String, String> BOM_HEADER_MAP = new LinkedHashMap<>();

    // PplanExcelVO에 대한 헤더 맵
    private static final Map<String, String> PPLAN_HEADER_MAP = new LinkedHashMap<>();

    // PlanQtyList에 대한 헤더 맵
    private static final Map<String, String> PLAN_QTY_LIST_HEADER_MAP = new LinkedHashMap<>();

    // PlanQtyBomList에 대한 헤더 맵
    private static final Map<String, String> PLAN_QTY_BOM_LIST_HEADER_MAP = new LinkedHashMap<>();
    
    //ProductList에 대한 헤더 맵
    private static final Map<String, String> PRODUCT_LIST_HEADER_MAP = new LinkedHashMap<>();

    static {
        // ItemInfoVO 헤더 맵 초기화
        ITEM_HEADER_MAP.put("itemCd", "품목코드");
        ITEM_HEADER_MAP.put("itemName", "품목명");
        ITEM_HEADER_MAP.put("unitType", "단위");
        ITEM_HEADER_MAP.put("plantLine", "생산라인");
        ITEM_HEADER_MAP.put("boxType", "Box규격");
        ITEM_HEADER_MAP.put("location", "재고위치");
        ITEM_HEADER_MAP.put("regDt", "등록일");

        // BomExcelVO 헤더 맵 초기화
        BOM_HEADER_MAP.put("itemCd", "품목코드");
        BOM_HEADER_MAP.put("itemName", "품목명");
        BOM_HEADER_MAP.put("unitType", "Box단위");
        BOM_HEADER_MAP.put("plantLine", "생산라인");
        BOM_HEADER_MAP.put("boxType", "Box규격");
        BOM_HEADER_MAP.put("bomCnt", "재료수");
        BOM_HEADER_MAP.put("regDt", "등록일");

        // PplanExcelVO 기본 헤더 맵 초기화
        PPLAN_HEADER_MAP.put("COMP_NAME", "거래처명");
        PPLAN_HEADER_MAP.put("ITEM_CD", "품번");
        PPLAN_HEADER_MAP.put("ITEM_NAME", "품명");

        // PlanQtyList 헤더 맵 초기화
        PLAN_QTY_LIST_HEADER_MAP.put("ITEM_CD", "품번");
        PLAN_QTY_LIST_HEADER_MAP.put("ITEM_NAME", "품명");
        PLAN_QTY_LIST_HEADER_MAP.put("PLAN_QTY", "계획수량");

        // PlanQtyBomList 헤더 맵 초기화
        PLAN_QTY_BOM_LIST_HEADER_MAP.put("SITEM_CD", "서브품번");
        PLAN_QTY_BOM_LIST_HEADER_MAP.put("ITEM_NAME", "품명");
        PLAN_QTY_BOM_LIST_HEADER_MAP.put("INS_QTY", "소요수량");
        PLAN_QTY_BOM_LIST_HEADER_MAP.put("BOX_QTY", "BOX수량");
        
        // ProductList 헤더 맵 초기화
        PRODUCT_LIST_HEADER_MAP.put("ITEM_CD", "품번");
        PRODUCT_LIST_HEADER_MAP.put("ITEM_NAME", "품명");
        PRODUCT_LIST_HEADER_MAP.put("SITEM_CD", "자재품번");
        PRODUCT_LIST_HEADER_MAP.put("SITEM_NAME", "자재품명");
        PRODUCT_LIST_HEADER_MAP.put("PRODUCT_QTY", "생산수량");
        PRODUCT_LIST_HEADER_MAP.put("INS_QTY", "투입수량");
        PRODUCT_LIST_HEADER_MAP.put("TOTAL_QTY", "소요수량");
        
    

        
    }

    public static Map<String, String> getItemHeaderMap() {
        return ITEM_HEADER_MAP;
    }

    public static Map<String, String> getBomHeaderMap() {
        return BOM_HEADER_MAP;
    }

    public static Map<String, String> getPplanHeaderMap() {
        return PPLAN_HEADER_MAP;
    }

    public static Map<String, String> getPlanQtyListHeaderMap() {
        return PLAN_QTY_LIST_HEADER_MAP;
    }

    public static Map<String, String> getPlanQtyBomListHeaderMap() {
        return PLAN_QTY_BOM_LIST_HEADER_MAP;
    }
    public static Map<String, String> getProductListHeaderMap() {
        return PRODUCT_LIST_HEADER_MAP;
    }
   
}
