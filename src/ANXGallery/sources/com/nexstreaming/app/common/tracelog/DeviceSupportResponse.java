package com.nexstreaming.app.common.tracelog;

import com.nexstreaming.app.common.tracelog.TLP.BaseResponse;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class DeviceSupportResponse implements BaseResponse {
    public DeviceInfo device_info;
    public MatchInfo match_info;
    public int next;
    public int result;

    public static class DeviceInfo {
        public int audio_codec_count;
        public List<ExportResInfo> export_res_extra;
        public List<ExportResInfo> export_res_hw;
        public List<ExportResInfo> export_res_sw;
        public int max_codec_mem_size;
        public int max_dec_count;
        public int max_dec_res_hw_b;
        public int max_dec_res_hw_h;
        public int max_dec_res_hw_m;
        public int max_dec_res_nexsw_b;
        public int max_dec_res_nexsw_h;
        public int max_dec_res_nexsw_m;
        public int max_dec_res_sw_b;
        public int max_dec_res_sw_h;
        public int max_dec_res_sw_m;
        public int max_enc_count;
        public int max_fhd_trans_time;
        public int max_fps;
        public int max_hw_import_res;
        public int max_sw_import_res;
        public Map<String, String> properties;
        public int rec_image_mode;
        public int rec_video_mode;
        public int support_avc;
        public int support_mpeg4v;
        public int supported;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("DeviceSupportResponse:\n");
            sb.append("  support_avc:");
            sb.append(this.support_avc);
            sb.append(10);
            sb.append("  support_mpeg4v:");
            sb.append(this.support_mpeg4v);
            sb.append(10);
            sb.append("  max_fps:");
            sb.append(this.max_fps);
            sb.append(10);
            sb.append("  max_codec_mem_size:");
            sb.append(this.max_codec_mem_size);
            sb.append(10);
            sb.append("  max_dec_count:");
            sb.append(this.max_dec_count);
            sb.append(10);
            sb.append("  max_enc_count:");
            sb.append(this.max_enc_count);
            sb.append(10);
            sb.append("  max_fhd_trans_time:");
            sb.append(this.max_fhd_trans_time);
            sb.append(10);
            sb.append("  rec_image_mode:");
            sb.append(this.rec_image_mode);
            sb.append(10);
            sb.append("  rec_video_mode:");
            sb.append(this.rec_video_mode);
            sb.append(10);
            sb.append("  audio_codec_count:");
            sb.append(this.audio_codec_count);
            sb.append(10);
            sb.append("  max_sw_import_res:");
            sb.append(this.max_sw_import_res);
            sb.append(10);
            sb.append("  max_hw_import_res:");
            sb.append(this.max_hw_import_res);
            sb.append(10);
            sb.append("  max_dec_res_nexsw_b:");
            sb.append(this.max_dec_res_nexsw_b);
            sb.append(10);
            sb.append("  max_dec_res_nexsw_b:");
            sb.append(this.max_dec_res_nexsw_b);
            sb.append(10);
            sb.append("  max_dec_res_nexsw_h:");
            sb.append(this.max_dec_res_nexsw_h);
            sb.append(10);
            sb.append("  max_dec_res_sw_b:");
            sb.append(this.max_dec_res_sw_b);
            sb.append(10);
            sb.append("  max_dec_res_sw_m:");
            sb.append(this.max_dec_res_sw_m);
            sb.append(10);
            sb.append("  max_dec_res_sw_h:");
            sb.append(this.max_dec_res_sw_h);
            sb.append(10);
            sb.append("  max_dec_res_hw_b:");
            sb.append(this.max_dec_res_hw_b);
            sb.append(10);
            sb.append("  max_dec_res_hw_m:");
            sb.append(this.max_dec_res_hw_m);
            sb.append(10);
            sb.append("  max_dec_res_hw_h:");
            sb.append(this.max_dec_res_hw_h);
            sb.append(10);
            int i = 0;
            if (this.export_res_sw == null) {
                sb.append("  export_res_sw: null\n");
            } else {
                sb.append("  export_res_sw:\n");
                int i2 = 0;
                for (ExportResInfo exportResInfo : this.export_res_sw) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("    [");
                    int i3 = i2 + 1;
                    sb2.append(i2);
                    sb2.append("] ");
                    sb2.append(exportResInfo.toString());
                    sb2.append("\n");
                    sb.append(sb2.toString());
                    i2 = i3;
                }
            }
            if (this.export_res_hw == null) {
                sb.append("  export_res_hw: null\n");
            } else {
                sb.append("  export_res_hw:\n");
                int i4 = 0;
                for (ExportResInfo exportResInfo2 : this.export_res_hw) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("    [");
                    int i5 = i4 + 1;
                    sb3.append(i4);
                    sb3.append("] ");
                    sb3.append(exportResInfo2.toString());
                    sb3.append("\n");
                    sb.append(sb3.toString());
                    i4 = i5;
                }
            }
            if (this.export_res_extra == null) {
                sb.append("  export_res_extra: null\n");
            } else {
                sb.append("  export_res_extra:\n");
                for (ExportResInfo exportResInfo3 : this.export_res_extra) {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("    [");
                    int i6 = i + 1;
                    sb4.append(i);
                    sb4.append("] ");
                    sb4.append(exportResInfo3.toString());
                    sb4.append("\n");
                    sb.append(sb4.toString());
                    i = i6;
                }
            }
            if (this.properties == null) {
                sb.append("  properties: null\n");
            } else {
                sb.append("  properties:\n");
                for (Entry entry : this.properties.entrySet()) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("    ");
                    sb5.append((String) entry.getKey());
                    sb5.append("=");
                    sb5.append((String) entry.getValue());
                    sb.append(sb5.toString());
                }
            }
            return sb.toString();
        }
    }

    public static class ExportResInfo {
        public int bitrate;
        public int display_height;
        public int height;
        public int width;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("<ExportResInfo ");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append(" disp=");
            sb.append(this.display_height);
            sb.append(" bitrate=");
            sb.append(this.bitrate);
            sb.append(">");
            return sb.toString();
        }
    }

    public static class MatchInfo {
        public String board_platform;
        public String build_device;
        public String build_model;
        public String manufacturer;
        public int os_api_level_max;
        public int os_api_level_min;
        public Integer record_idx;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("MatchInfo:\n");
            sb.append("  record_idx:");
            sb.append(this.record_idx);
            sb.append(10);
            sb.append("  build_device:");
            sb.append(this.build_device);
            sb.append(10);
            sb.append("  build_model:");
            sb.append(this.build_model);
            sb.append(10);
            sb.append("  board_platform:");
            sb.append(this.board_platform);
            sb.append(10);
            sb.append("  manufacturer:");
            sb.append(this.manufacturer);
            sb.append(10);
            sb.append("  os_api_level_min:");
            sb.append(this.os_api_level_min);
            sb.append(10);
            sb.append("  os_api_level_max:");
            sb.append(this.os_api_level_max);
            sb.append(10);
            return sb.toString();
        }
    }

    public int getResult() {
        return this.result;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DeviceSupportResponse:\n");
        sb.append("  result:");
        sb.append(this.result);
        sb.append(10);
        sb.append("  next:");
        sb.append(this.next);
        sb.append(10);
        if (this.match_info == null) {
            sb.append("  match_info: null\n");
        } else {
            sb.append("  match_info:\n");
            sb.append(this.match_info.toString().replaceAll("(?m)^", "    "));
        }
        if (this.device_info == null) {
            sb.append("  device_info: null\n");
        } else {
            sb.append("  device_info:\n");
            sb.append(this.device_info.toString().replaceAll("(?m)^", "    "));
        }
        return sb.toString();
    }
}
