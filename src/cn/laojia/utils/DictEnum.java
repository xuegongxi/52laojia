package cn.laojia.utils;

import java.util.Map;

/** �ֵ�ö�ٶ��� */
public class DictEnum {
	
	/**1000- �������״̬**/
	public static  class News_Approve{
		/** 1000-2  ����ͨ�� */
		public static final String  NEWS_APPROVE_PASS  = "1000-2";
		/** 1000-1  ������ͨ�� */
		public static final String  NEWS_APPROVE_NOPASS ="1000-1";
		/** 1000-0 δ���� */
		public static final String  NEWS_APPROVE_NOSTART="1000-0";
	}
	
	
	/**1001- ��Ϣ����**/
	public static  class News_Type{
		/** 1001-0  ���綯̬ */
		public static final String  NEWS_TYPE_NEW  = "1001-0";
		/** 1001-1  ������ʳ */
		public static final String  NEWS_TYPE_FOOD ="1001-1";
		/** 1001-2 �����ز� */
		public static final String  NEWS_TYPE_NATIVE="1001-2";
		/** 1001-3 �����Ļ� */
		public static final String  NEWS_TYPE_CIVILIZATION="1001-3";
		/** 1001-4 ������־ */
		public static final String  NEWS_TYPE_TOUR="1001-4";
		 
	}
	
	
	
	

	/** 1002-�Ա� */
	public static class Sex {
		/** 10-�� */
		public static final String MALE = "10";

		/** 11-Ů */
		public static final String FEMALE = "11";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"10\":\"��\",\"11\":\"Ů\"}");
	}



	/** 1011-�Ƿ���� */
	public static class IsNeedInput {
		/** 10-�� */
		public static final String NO = "10";

		/** 11-�� */
		public static final String YES = "11";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"10\":\"��\",\"11\":\"��\"}");
	}

	
	/**
	 * �����������
	 * 
	 * @author maochangming
	 * 
	 */
	public static class BatchType {

		/**
		 * �˹���¼
		 */
		public static final int Input = 1;

		/**
		 * �ճ�����
		 */
		public static final int Audit = 2;

		/**
		 * �ɵ�Ԥ��
		 */
		public static final int Risk = 3;

		/**
		 * ר�����
		 */
		public static final int Expaudit = 4;

		/**
		 * �ɵ��Ų�
		 */
		public static final int DoubtAnalyse = 5;

		/**
		 * �˹�У��
		 */
		public static final int Verify = 6;

	}

	/** 1013-���δ���״̬ */
	public static class BatchStatus {
		/** 01-δ���� */
		public static final String INACTIVE = "01";

		/** 02-�Ѽ��� */
		public static final String ACTIVATED = "02";

		/** 03-������ */
		public static final String PROCESSING = "03";

		/** 04-�ѹ��� */
		public static final String HANDUP = "04";

		/** 05-����� */
		public static final String FINISH = "05";

		/** 06-��ʧ�� */
		public static final String FAILURE = "06";

		/** 07-����ɨ */
		public static final String WAIT_RESCAN = "07";

		/** 10-����ʧ�� */
		public static final String ANALY_FAILURE = "10";
		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ����\",\"02\":\"�Ѽ���\",\"03\":\"������\",\"04\":\"�ѹ���\",\"05\":\"�����\",\"06\":\"��ʧ��\",\"07\":\"����ɨ\",\"10\":\"����ʧ��\"}");

	}

	/** 1014-���Ա�־ */
	public static class CompStatus {
		/** 01-δ֪ */
		public static final String NONE_COMP = "01";

		/** 02-�Զ� */
		public static final String AUTO_COMP_SUCCESS = "02";

		/** 03-�ֹ� */
		public static final String HAND_COMP_SUCCESS = "03";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ֪\",\"02\":\"�Զ�\",\"03\":\"�ֹ�\"}");
	}

	/** 1015-Դ�������� */
	public static class DataSourceType {
		/** 01-������������ */
		public static final String SAVING_FINANCIAL_DATA = "01";

		/** 02-������������� */
		public static final String SAVING_NO_FINANCIAL_DATA = "02";

		/** 03-���������� */
		public static final String SAVING_ACCOUNTING_DATA = "03";

		/** 04-���������ˮ */
		public static final String EXCHANGE_ACCOUNTING_DATA = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"������������\",\"02\":\"�������������\",\"03\":\"����������\",\"04\":\"���������ˮ\"}");
	}

	/** 1016-��ˮ���˱�־ */
	public static class FlowFilterStatus {
		/** 00-���� */
		public static final String FILTER = "00";

		/** 01-������ */
		public static final String NO_FILTER = "01";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"00\":\"����\",\"01\":\"������\"}");
	}

	/** 1017-��������־ */
	public static class MainFlag {
		/** 01-���� */
		public static final String MAIN = "01";

		/** 02-���� */
		public static final String ATTACHMENT = "02";

		/** 03-���� */
		public static final String OTHER = "03";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"����\",\"02\":\"����\",\"03\":\"����\"}");
	}

	/** 1018-�ɵ�����Դ */
	public static class ErrDoubtSource {
		/** 01-�˹���¼ */
		public static final String MANUALWORK = "01";

		/** 02-�ճ����� */
		public static final String DAILY_MANAGE = "02";

		/** 03-�ٻ��� */
		public static final String MANAGE_AGAIN = "03";

		/** 04-�ɵ�Ԥ�� */
		public static final String DOUBLE_WARNING = "04";

		/** 05-�ֹ��Ǽǲ�� */
		public static final String HAND_REG_ERR = "05";

		/** 06-ƾ֤��ɨ */
		public static final String IMG_ADD_SCAN = "06";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"�˹���¼\",\"02\":\"�ճ�����\",\"03\":\"�ٻ���\",\"04\":\"�ɵ�Ԥ��\",\"05\":\"�ֹ��Ǽǲ��\",\"06\":\"ƾ֤��ɨ\"}");
	}

	/** 1019-�ɵ����ʼ״̬ */
	public static class ErrDoubtInitState {
		/** 00-���� */
		public static final String NORMAL = "00";

		/** 01-�ɵ� */
		public static final String ERROR = "01";

		/** 02-��� */
		public static final String DOUBT = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"00\":\"����\",\"01\":\"�ɵ�\",\"02\":\"���\"}");
	}



	/** 1021-�ɵ����Ƿ񷢲�ɨ֪ͨ */
	public static class ErrDoubtAddScanNotice {
		/** 01-δ�� */
		public static final String NO_SEND = "01";

		/** 02-�ѷ� */
		public static final String SENDED = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ��\",\"02\":\"�ѷ�\"}");
	}

	/** 1022-�ɵ���ɨ״̬ */
	public static class ErrDoubtAddScanState {
		/** 01-δ��ɨ���� */
		public static final String NO_ADD_SCAN = "01";

		/** 03-�Ѳ�ɨ */
		public static final String HAVE_ADD_SCAN = "03";

		/** 04-�ȴ��Ͻɲ�ɨƾ֤ */
		public static final String WAIT_NEED_ADD_SCAN_VOUCHER = "04";

		/** 05-��ɨ���� */
		public static final String ADD_SCAN_CANCEL = "05";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ��ɨ����\",\"03\":\"�Ѳ�ɨ\",\"04\":\"�ȴ��Ͻɲ�ɨƾ֤\",\"05\":\"��ɨ����\"}");
	}

	/** 1023-�������ͷ�ʽ */
	public static class ArchiveSendType {
		/** 01-ֱ�� */
		public static final String DIRECT = "01";

		/** 02-ת�� */
		public static final String TRANSFER = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"ֱ��\",\"02\":\"ת��\"}");
	}

	/** 1024-��������״̬ */
	public static class ArchiveSendState {
		/** 01-��ת�� */
		public static final String SENDED = "01";

		/** 02-ת�������� */
		public static final String TRANSFERED = "02";

		/** 03-ֱ�������� */
		public static final String RECEIVED = "03";

		/** 04-�ѽ��� */
		public static final String RETURNED = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"��ת��\",\"02\":\"ת��������\",\"03\":\"ֱ��������\",\"04\":\"�ѽ���\"}");
	}

	/** 1025-������������ */
	public static class ArchiveSendChannel {
		/** 01-EMS */
		public static final String EMS = "01";

		/** 02-���� */
		public static final String LOGISTICS = "02";

		/** 03-��Ҫ */
		public static final String VERTRAULICH = "03";

		/** 04-������ʽ */
		public static final String OTHER = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"EMS\",\"02\":\"����\",\"03\":\"��Ҫ\",\"04\":\"������ʽ\"}");
	}

	/** 1026-�ɵ�Ԥ��������״̬ */
	public static class RiskBatchDealState {
		/** 01-δ���� */
		public static final String WAIT_DISPOSE = "01";

		/** 02-���ڴ��� */
		public static final String DISPOSING = "02";

		/** 03-���� */
		public static final String HANGUP = "03";

		/** 04-������� */
		public static final String DISPOSED = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ����\",\"02\":\"���ڴ���\",\"03\":\"����\",\"04\":\"�������\"}");
	}

	/** 1027-�ɵ�Ԥ����ϸ�����־ */
	public static class RiskDetailDealState {
		/** 01-δ���� */
		public static final String WAIT_DISPOSE = "01";

		/** 02-�ɵ� */
		public static final String TO_DOUBT = "02";

		/** 03-��� */
		public static final String TO_ERROR = "03";

		/** 04-��ע�� */
		public static final String CONFIRMED = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ����\",\"02\":\"�ɵ�\",\"03\":\"���\",\"04\":\"��ע��\"}");
	}

	/** 1028-��ɲ�¼��־ */
	public static class CompleteInputState {
		/** 01-δ��� */
		public static final String NO_COMPLETE = "01";

		/** 02-����� */
		public static final String HAVE_COMPLETE = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ���\",\"02\":\"�����\"}");
	}

	/** 1029-�ɵ����Ƿ񶽰� */
	public static class ErrDoubtIsSupervise {
		/** 01-���� */
		public static final String NEED_SUPERVISE = "01";

		/** 02-������ */
		public static final String NO_SUPERVISE = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"����\",\"02\":\"������\"}");
	}

	/** 1030-Ԥ������ */
	public static class RiskType {
		/** 01-����Ԥ���� */
		public static final String ACCOUNTING = "01";

		/** 02-ƾ֤Ԥ���� */
		public static final String VOUCHER = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"����Ԥ����\",\"02\":\"ƾ֤Ԥ����\"}");
	}

	/** 1031-Ԥ���ȼ� */
	public static class RiskLevel {
		/** 01-һ�� */
		public static final String LEVEL_1 = "01";

		/** 02-���� */
		public static final String LEVEL_2 = "02";

		/** 03-���� */
		public static final String LEVEL_3 = "03";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"һ��\",\"02\":\"����\",\"03\":\"����\"}");
	}

	/** 1032-����״̬ */
	public static class ValidState {
		/** 01-������ */
		public static final String VALID = "01";

		/** 02-δ���� */
		public static final String INVALID = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"������\",\"02\":\"δ����\"}");
	}

	/** 1033-���ݱ��״̬ */
	public static class DataChangeState {
		/** 01-��� */
		public static final String ADD = "01";

		/** 02-�޸� */
		public static final String MODIFY = "02";

		/** 03-ɾ�� */
		public static final String DELETE = "03";

		/** 04-ͣ�� */
		public static final String INVALID = "04";

		/** 05-���� */
		public static final String VALID = "05";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"���\",\"02\":\"�޸�\",\"03\":\"ɾ��\",\"04\":\"ͣ��\",\"05\":\"����\"}");
	}

	/** 1034-���˱�־ */
	public static class AuditFlag {
		/** 01-δ���� */
		public static final String WAIT_AUDIT = "01";

		/** 02-����ȷ�� */
		public static final String HAVE_AUDIT = "02";

		/** 03-�Ǽ��ɵ� */
		public static final String RECORD_DOUBT = "03";

		/** 04-�Ǽǲ�� */
		public static final String RECORD_ERROR = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ����\",\"02\":\"����ȷ��\",\"03\":\"�Ǽ��ɵ�\",\"04\":\"�Ǽǲ��\"}");
	}


	/** 1037-�ļ�����״̬ */
	public static class FileDealState {
		/** 01-������ */
		public static final String PROCESSING = "01";

		/** 02-����� */
		public static final String COMPLETE = "02";

		/** 03-��ʧ�� */
		public static final String FAILURE = "03";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"������\",\"02\":\"�����\",\"03\":\"��ʧ��\"}");
	}

	/** 1038-���ݴ���״̬ */
	public static class DataDealState {
		/** 01-������ */
		public static final String PROCESSING = "01";

		/** 02-����� */
		public static final String COMPLETE = "02";

		/** 03-��ʧ�� */
		public static final String FAILURE = "03";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"������\",\"02\":\"�����\",\"03\":\"��ʧ��\"}");
	}

	


	/** 1041-�ս�״̬ */
	public static class DayFinishState {
		/** 01-δ�ս� */
		public static final String NO_FINISH = "01";

		/** 02-���ս� */
		public static final String HAVE_FINISH = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ�ս�\",\"02\":\"���ս�\"}");
	}

	/** 1042-�û����� */
	public static class UserType {
		/** 01-���������û� */
		public static final String USER_IN_AUDIT_CENTER = "01";

		/** 02-��֧�����û� */
		public static final String USER_IN_BRANCH = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"���������û�\",\"02\":\"��֧�����û�\"}");
	}

	
	/** 1068-ר�����������״̬ */
	public static class ExpAuditTaskFlag {
		/** 01-δ���� */
		public static final String INVALID = "01";

		/** 02-������ */
		public static final String PROCESSING = "02";

		/** 03-�Ѵ��� */
		public static final String FINISH = "03";

		/** 04-���������� */
		public static final String REPORT_GENERATED = "04";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"δ����\",\"02\":\"������\",\"03\":\"�Ѵ���\",\"04\":\"����������\"}");
	}

	

	/** 1070-��ɨ�Ƿ�Ǽǲ�� */
	public static class ImgAddScanIsRegError {
		/** 01-�޲�� */
		public static final String NO_ERROR = "01";

		/** 02-�в�� */
		public static final String HAVE_ERROR = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"�޲��\",\"02\":\"�в��\"}");
	}

	/** 1071-������ı�־ */
	public static class ErrorAdjustFlag {
		/** 01-�ϸ� */
		public static final String QUALIFIED = "01";

		/** 02-���ϸ� */
		public static final String NOT_QUALIFIED = "02";

		/** �����ֵ��ϣ�� **/
		public static Map dataMap = JSONUtil
				.parseJSON2Map("{\"01\":\"�ϸ�\",\"02\":\"���ϸ�\"}");
	}


	
}
