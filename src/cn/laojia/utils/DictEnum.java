package cn.laojia.utils;

import java.util.Map;

/** 字典枚举定义 */
public class DictEnum {
	
	/**1000- 文章审核状态**/
	public static  class News_Approve{
		/** 1000-2  审批通过 */
		public static final String  NEWS_APPROVE_PASS  = "1000-2";
		/** 1000-1  审批不通过 */
		public static final String  NEWS_APPROVE_NOPASS ="1000-1";
		/** 1000-0 未审批 */
		public static final String  NEWS_APPROVE_NOSTART="1000-0";
	}
	
	
	/**1001- 信息类型**/
	public static  class News_Type{
		/** 1001-0  家乡动态 */
		public static final String  NEWS_TYPE_NEW  = "1001-0";
		/** 1001-1  家乡美食 */
		public static final String  NEWS_TYPE_FOOD ="1001-1";
		/** 1001-2 家乡特产 */
		public static final String  NEWS_TYPE_NATIVE="1001-2";
		/** 1001-3 风俗文化 */
		public static final String  NEWS_TYPE_CIVILIZATION="1001-3";
		/** 1001-4 旅游日志 */
		public static final String  NEWS_TYPE_TOUR="1001-4";
		 
	}
	
	
	
	

	/** 1002-性别 */
	public static class Sex {
		/** 10-男 */
		public static final String MALE = "10";

		/** 11-女 */
		public static final String FEMALE = "11";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"10\":\"男\",\"11\":\"女\"}");
	}



	/** 1011-是否必输 */
	public static class IsNeedInput {
		/** 10-否 */
		public static final String NO = "10";

		/** 11-是 */
		public static final String YES = "11";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"10\":\"否\",\"11\":\"是\"}");
	}

	
	/**
	 * 任务分配类型
	 * 
	 * @author maochangming
	 * 
	 */
	public static class BatchType {

		/**
		 * 人工补录
		 */
		public static final int Input = 1;

		/**
		 * 日常稽核
		 */
		public static final int Audit = 2;

		/**
		 * 疑点预警
		 */
		public static final int Risk = 3;

		/**
		 * 专项稽核
		 */
		public static final int Expaudit = 4;

		/**
		 * 疑点排查
		 */
		public static final int DoubtAnalyse = 5;

		/**
		 * 人工校验
		 */
		public static final int Verify = 6;

	}

	/** 1013-批次处理状态 */
	public static class BatchStatus {
		/** 01-未激活 */
		public static final String INACTIVE = "01";

		/** 02-已激活 */
		public static final String ACTIVATED = "02";

		/** 03-处理中 */
		public static final String PROCESSING = "03";

		/** 04-已挂起 */
		public static final String HANDUP = "04";

		/** 05-已完成 */
		public static final String FINISH = "05";

		/** 06-已失败 */
		public static final String FAILURE = "06";

		/** 07-待重扫 */
		public static final String WAIT_RESCAN = "07";

		/** 10-解析失败 */
		public static final String ANALY_FAILURE = "10";
		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未激活\",\"02\":\"已激活\",\"03\":\"处理中\",\"04\":\"已挂起\",\"05\":\"已完成\",\"06\":\"已失败\",\"07\":\"待重扫\",\"10\":\"解析失败\"}");

	}

	/** 1014-勾对标志 */
	public static class CompStatus {
		/** 01-未知 */
		public static final String NONE_COMP = "01";

		/** 02-自动 */
		public static final String AUTO_COMP_SUCCESS = "02";

		/** 03-手工 */
		public static final String HAND_COMP_SUCCESS = "03";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未知\",\"02\":\"自动\",\"03\":\"手工\"}");
	}

	/** 1015-源数据类型 */
	public static class DataSourceType {
		/** 01-储蓄账务数据 */
		public static final String SAVING_FINANCIAL_DATA = "01";

		/** 02-储蓄非账务数据 */
		public static final String SAVING_NO_FINANCIAL_DATA = "02";

		/** 03-储蓄会计数据 */
		public static final String SAVING_ACCOUNTING_DATA = "03";

		/** 04-汇兑账务流水 */
		public static final String EXCHANGE_ACCOUNTING_DATA = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"储蓄账务数据\",\"02\":\"储蓄非账务数据\",\"03\":\"储蓄会计数据\",\"04\":\"汇兑账务流水\"}");
	}

	/** 1016-流水过滤标志 */
	public static class FlowFilterStatus {
		/** 00-过滤 */
		public static final String FILTER = "00";

		/** 01-不过滤 */
		public static final String NO_FILTER = "01";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"00\":\"过滤\",\"01\":\"不过滤\"}");
	}

	/** 1017-主附件标志 */
	public static class MainFlag {
		/** 01-主件 */
		public static final String MAIN = "01";

		/** 02-附件 */
		public static final String ATTACHMENT = "02";

		/** 03-其它 */
		public static final String OTHER = "03";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"主件\",\"02\":\"附件\",\"03\":\"其它\"}");
	}

	/** 1018-疑点差错来源 */
	public static class ErrDoubtSource {
		/** 01-人工补录 */
		public static final String MANUALWORK = "01";

		/** 02-日常稽核 */
		public static final String DAILY_MANAGE = "02";

		/** 03-再稽核 */
		public static final String MANAGE_AGAIN = "03";

		/** 04-疑点预警 */
		public static final String DOUBLE_WARNING = "04";

		/** 05-手工登记差错 */
		public static final String HAND_REG_ERR = "05";

		/** 06-凭证补扫 */
		public static final String IMG_ADD_SCAN = "06";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"人工补录\",\"02\":\"日常稽核\",\"03\":\"再稽核\",\"04\":\"疑点预警\",\"05\":\"手工登记差错\",\"06\":\"凭证补扫\"}");
	}

	/** 1019-疑点差错初始状态 */
	public static class ErrDoubtInitState {
		/** 00-正常 */
		public static final String NORMAL = "00";

		/** 01-疑点 */
		public static final String ERROR = "01";

		/** 02-差错 */
		public static final String DOUBT = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"00\":\"正常\",\"01\":\"疑点\",\"02\":\"差错\"}");
	}



	/** 1021-疑点差错是否发补扫通知 */
	public static class ErrDoubtAddScanNotice {
		/** 01-未发 */
		public static final String NO_SEND = "01";

		/** 02-已发 */
		public static final String SENDED = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未发\",\"02\":\"已发\"}");
	}

	/** 1022-疑点差错补扫状态 */
	public static class ErrDoubtAddScanState {
		/** 01-未补扫处理 */
		public static final String NO_ADD_SCAN = "01";

		/** 03-已补扫 */
		public static final String HAVE_ADD_SCAN = "03";

		/** 04-等待上缴补扫凭证 */
		public static final String WAIT_NEED_ADD_SCAN_VOUCHER = "04";

		/** 05-补扫撤销 */
		public static final String ADD_SCAN_CANCEL = "05";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未补扫处理\",\"03\":\"已补扫\",\"04\":\"等待上缴补扫凭证\",\"05\":\"补扫撤销\"}");
	}

	/** 1023-档案寄送方式 */
	public static class ArchiveSendType {
		/** 01-直发 */
		public static final String DIRECT = "01";

		/** 02-转发 */
		public static final String TRANSFER = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"直发\",\"02\":\"转发\"}");
	}

	/** 1024-档案寄送状态 */
	public static class ArchiveSendState {
		/** 01-待转发 */
		public static final String SENDED = "01";

		/** 02-转发待接收 */
		public static final String TRANSFERED = "02";

		/** 03-直发待接收 */
		public static final String RECEIVED = "03";

		/** 04-已接收 */
		public static final String RETURNED = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"待转发\",\"02\":\"转发待接收\",\"03\":\"直发待接收\",\"04\":\"已接收\"}");
	}

	/** 1025-档案运送渠道 */
	public static class ArchiveSendChannel {
		/** 01-EMS */
		public static final String EMS = "01";

		/** 02-物流 */
		public static final String LOGISTICS = "02";

		/** 03-机要 */
		public static final String VERTRAULICH = "03";

		/** 04-其它方式 */
		public static final String OTHER = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"EMS\",\"02\":\"物流\",\"03\":\"机要\",\"04\":\"其它方式\"}");
	}

	/** 1026-疑点预警批处理状态 */
	public static class RiskBatchDealState {
		/** 01-未处理 */
		public static final String WAIT_DISPOSE = "01";

		/** 02-正在处理 */
		public static final String DISPOSING = "02";

		/** 03-挂起 */
		public static final String HANGUP = "03";

		/** 04-处理完毕 */
		public static final String DISPOSED = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未处理\",\"02\":\"正在处理\",\"03\":\"挂起\",\"04\":\"处理完毕\"}");
	}

	/** 1027-疑点预警明细处理标志 */
	public static class RiskDetailDealState {
		/** 01-未处理 */
		public static final String WAIT_DISPOSE = "01";

		/** 02-疑点 */
		public static final String TO_DOUBT = "02";

		/** 03-差错 */
		public static final String TO_ERROR = "03";

		/** 04-已注销 */
		public static final String CONFIRMED = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未处理\",\"02\":\"疑点\",\"03\":\"差错\",\"04\":\"已注销\"}");
	}

	/** 1028-完成补录标志 */
	public static class CompleteInputState {
		/** 01-未完成 */
		public static final String NO_COMPLETE = "01";

		/** 02-已完成 */
		public static final String HAVE_COMPLETE = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未完成\",\"02\":\"已完成\"}");
	}

	/** 1029-疑点差错是否督办 */
	public static class ErrDoubtIsSupervise {
		/** 01-督办 */
		public static final String NEED_SUPERVISE = "01";

		/** 02-不督办 */
		public static final String NO_SUPERVISE = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"督办\",\"02\":\"不督办\"}");
	}

	/** 1030-预警类型 */
	public static class RiskType {
		/** 01-账务预警类 */
		public static final String ACCOUNTING = "01";

		/** 02-凭证预警类 */
		public static final String VOUCHER = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"账务预警类\",\"02\":\"凭证预警类\"}");
	}

	/** 1031-预警等级 */
	public static class RiskLevel {
		/** 01-一级 */
		public static final String LEVEL_1 = "01";

		/** 02-二级 */
		public static final String LEVEL_2 = "02";

		/** 03-三级 */
		public static final String LEVEL_3 = "03";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"一级\",\"02\":\"二级\",\"03\":\"三级\"}");
	}

	/** 1032-启用状态 */
	public static class ValidState {
		/** 01-已启用 */
		public static final String VALID = "01";

		/** 02-未启用 */
		public static final String INVALID = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"已启用\",\"02\":\"未启用\"}");
	}

	/** 1033-数据变更状态 */
	public static class DataChangeState {
		/** 01-添加 */
		public static final String ADD = "01";

		/** 02-修改 */
		public static final String MODIFY = "02";

		/** 03-删除 */
		public static final String DELETE = "03";

		/** 04-停用 */
		public static final String INVALID = "04";

		/** 05-启用 */
		public static final String VALID = "05";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"添加\",\"02\":\"修改\",\"03\":\"删除\",\"04\":\"停用\",\"05\":\"启用\"}");
	}

	/** 1034-稽核标志 */
	public static class AuditFlag {
		/** 01-未稽核 */
		public static final String WAIT_AUDIT = "01";

		/** 02-正常确认 */
		public static final String HAVE_AUDIT = "02";

		/** 03-登记疑点 */
		public static final String RECORD_DOUBT = "03";

		/** 04-登记差错 */
		public static final String RECORD_ERROR = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未稽核\",\"02\":\"正常确认\",\"03\":\"登记疑点\",\"04\":\"登记差错\"}");
	}


	/** 1037-文件处理状态 */
	public static class FileDealState {
		/** 01-处理中 */
		public static final String PROCESSING = "01";

		/** 02-已完成 */
		public static final String COMPLETE = "02";

		/** 03-已失败 */
		public static final String FAILURE = "03";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"处理中\",\"02\":\"已完成\",\"03\":\"已失败\"}");
	}

	/** 1038-数据处理状态 */
	public static class DataDealState {
		/** 01-处理中 */
		public static final String PROCESSING = "01";

		/** 02-已完成 */
		public static final String COMPLETE = "02";

		/** 03-已失败 */
		public static final String FAILURE = "03";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"处理中\",\"02\":\"已完成\",\"03\":\"已失败\"}");
	}

	


	/** 1041-日结状态 */
	public static class DayFinishState {
		/** 01-未日结 */
		public static final String NO_FINISH = "01";

		/** 02-已日结 */
		public static final String HAVE_FINISH = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未日结\",\"02\":\"已日结\"}");
	}

	/** 1042-用户类型 */
	public static class UserType {
		/** 01-稽核中心用户 */
		public static final String USER_IN_AUDIT_CENTER = "01";

		/** 02-分支机构用户 */
		public static final String USER_IN_BRANCH = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"稽核中心用户\",\"02\":\"分支机构用户\"}");
	}

	
	/** 1068-专项稽核任务处理状态 */
	public static class ExpAuditTaskFlag {
		/** 01-未处理 */
		public static final String INVALID = "01";

		/** 02-处理中 */
		public static final String PROCESSING = "02";

		/** 03-已处理 */
		public static final String FINISH = "03";

		/** 04-报告已生成 */
		public static final String REPORT_GENERATED = "04";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"未处理\",\"02\":\"处理中\",\"03\":\"已处理\",\"04\":\"报告已生成\"}");
	}

	

	/** 1070-补扫是否登记差错 */
	public static class ImgAddScanIsRegError {
		/** 01-无差错 */
		public static final String NO_ERROR = "01";

		/** 02-有差错 */
		public static final String HAVE_ERROR = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"无差错\",\"02\":\"有差错\"}");
	}

	/** 1071-差错整改标志 */
	public static class ErrorAdjustFlag {
		/** 01-合格 */
		public static final String QUALIFIED = "01";

		/** 02-不合格 */
		public static final String NOT_QUALIFIED = "02";

		/** 数据字典哈希表 **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"合格\",\"02\":\"不合格\"}");
	}


	
}
