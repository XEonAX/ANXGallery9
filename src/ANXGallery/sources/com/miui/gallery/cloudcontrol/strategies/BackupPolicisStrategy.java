package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.util.MiscUtil;
import java.util.HashMap;
import java.util.List;

public class BackupPolicisStrategy extends BaseStrategy {
    @SerializedName("policies")
    private List<PolicyWrapper> mPolicies;
    private transient HashMap<String, PolicyWrapper> mPoliciesMap;

    public static class Policy {
        @SerializedName("disallow-metered")
        private boolean mDisallowMetered;
        @SerializedName("expedited")
        private boolean mExpedited;
        @SerializedName("ignore-battery")
        private boolean mIgnoreBattery;
        @SerializedName("manual")
        private boolean mManual;
        @SerializedName("require-charging")
        private boolean mRequireCharging;

        public boolean isDisallowMetered() {
            return this.mDisallowMetered;
        }

        public boolean isIgnoreBattery() {
            return this.mIgnoreBattery;
        }

        public boolean isRequireCharging() {
            return this.mRequireCharging;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Policy{mDisallowMetered='");
            sb.append(this.mDisallowMetered);
            sb.append(", mRequireCharging=");
            sb.append(this.mRequireCharging);
            sb.append(", mIgnoreBattery=");
            sb.append(this.mIgnoreBattery);
            sb.append(", mManual=");
            sb.append(this.mManual);
            sb.append(", mExpedited=");
            sb.append(this.mExpedited);
            sb.append('}');
            return sb.toString();
        }
    }

    public static class PolicyWrapper {
        @SerializedName("enable")
        private boolean mEnable;
        @SerializedName("policy")
        private Policy mPolicy;
        @SerializedName("type")
        private String mType;

        public String getType() {
            return this.mType;
        }

        public boolean isDisallowMetered() {
            if (this.mPolicy != null) {
                return this.mPolicy.isDisallowMetered();
            }
            return true;
        }

        public boolean isEnable() {
            return this.mEnable;
        }

        public boolean isIgnoreBattery() {
            if (this.mPolicy != null) {
                return this.mPolicy.isIgnoreBattery();
            }
            return false;
        }

        public boolean isRequireCharging() {
            if (this.mPolicy != null) {
                return this.mPolicy.isRequireCharging();
            }
            return false;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("PolicyWrapper{mType='");
            sb.append(this.mType);
            sb.append(", mPolicy=");
            sb.append(this.mPolicy);
            sb.append('}');
            return sb.toString();
        }
    }

    public void doAdditionalProcessing() {
        if (this.mPoliciesMap == null) {
            this.mPoliciesMap = new HashMap<>();
        } else {
            this.mPoliciesMap.clear();
        }
        if (MiscUtil.isValid(this.mPolicies)) {
            for (PolicyWrapper policyWrapper : this.mPolicies) {
                if (!TextUtils.isEmpty(policyWrapper.getType())) {
                    this.mPoliciesMap.put(policyWrapper.getType(), policyWrapper);
                }
            }
        }
    }

    public PolicyWrapper getPolicy(String str) {
        return (PolicyWrapper) this.mPoliciesMap.get(str);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("BackupPolicisStrategy{mPolicies=");
        sb.append(this.mPolicies);
        sb.append('}');
        return sb.toString();
    }
}
