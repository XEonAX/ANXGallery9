package com.google.zxing;

import com.google.zxing.aztec.AztecWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.datamatrix.DataMatrixWriter;
import com.google.zxing.oned.CodaBarWriter;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.oned.Code39Writer;
import com.google.zxing.oned.EAN13Writer;
import com.google.zxing.oned.EAN8Writer;
import com.google.zxing.oned.ITFWriter;
import com.google.zxing.oned.UPCAWriter;
import com.google.zxing.pdf417.PDF417Writer;
import com.google.zxing.qrcode.QRCodeWriter;
import java.util.Map;

public final class MultiFormatWriter implements Writer {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$BarcodeFormat;

    /* JADX WARNING: Can't wrap try/catch for region: R(37:3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|40) */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:10:0x0027 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:12:0x0030 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:14:0x0039 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:16:0x0042 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:18:0x004c */
    /* JADX WARNING: Missing exception handler attribute for start block: B:20:0x0055 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:22:0x005f */
    /* JADX WARNING: Missing exception handler attribute for start block: B:24:0x0069 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:26:0x0073 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:28:0x007d */
    /* JADX WARNING: Missing exception handler attribute for start block: B:30:0x0087 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:32:0x0091 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:34:0x009b */
    /* JADX WARNING: Missing exception handler attribute for start block: B:36:0x00a5 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:6:0x0015 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:8:0x001e */
    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$BarcodeFormat() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$BarcodeFormat;
        if (iArr != null) {
            return iArr;
        }
        int[] iArr2 = new int[BarcodeFormat.values().length];
        iArr2[BarcodeFormat.AZTEC.ordinal()] = 1;
        iArr2[BarcodeFormat.CODABAR.ordinal()] = 2;
        iArr2[BarcodeFormat.CODE_128.ordinal()] = 5;
        iArr2[BarcodeFormat.CODE_39.ordinal()] = 3;
        iArr2[BarcodeFormat.CODE_93.ordinal()] = 4;
        iArr2[BarcodeFormat.DATA_MATRIX.ordinal()] = 6;
        iArr2[BarcodeFormat.EAN_13.ordinal()] = 8;
        iArr2[BarcodeFormat.EAN_8.ordinal()] = 7;
        iArr2[BarcodeFormat.ITF.ordinal()] = 9;
        iArr2[BarcodeFormat.MAXICODE.ordinal()] = 10;
        iArr2[BarcodeFormat.PDF_417.ordinal()] = 11;
        iArr2[BarcodeFormat.QR_CODE.ordinal()] = 12;
        iArr2[BarcodeFormat.RSS_14.ordinal()] = 13;
        iArr2[BarcodeFormat.RSS_EXPANDED.ordinal()] = 14;
        iArr2[BarcodeFormat.UPC_A.ordinal()] = 15;
        iArr2[BarcodeFormat.UPC_E.ordinal()] = 16;
        iArr2[BarcodeFormat.UPC_EAN_EXTENSION.ordinal()] = 17;
        $SWITCH_TABLE$com$google$zxing$BarcodeFormat = iArr2;
        return iArr2;
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        Writer writer;
        switch ($SWITCH_TABLE$com$google$zxing$BarcodeFormat()[barcodeFormat.ordinal()]) {
            case 1:
                writer = new AztecWriter();
                break;
            case 2:
                writer = new CodaBarWriter();
                break;
            case 3:
                writer = new Code39Writer();
                break;
            case 5:
                writer = new Code128Writer();
                break;
            case 6:
                writer = new DataMatrixWriter();
                break;
            case 7:
                writer = new EAN8Writer();
                break;
            case 8:
                writer = new EAN13Writer();
                break;
            case 9:
                writer = new ITFWriter();
                break;
            case 11:
                writer = new PDF417Writer();
                break;
            case 12:
                writer = new QRCodeWriter();
                break;
            case 15:
                writer = new UPCAWriter();
                break;
            default:
                StringBuilder sb = new StringBuilder("No encoder available for format ");
                sb.append(barcodeFormat);
                throw new IllegalArgumentException(sb.toString());
        }
        return writer.encode(str, barcodeFormat, i, i2, map);
    }
}
