package com.miui.gallery.cloud.policy;

import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.strategies.BackupPolicisStrategy;
import com.miui.gallery.util.Log;
import java.util.HashMap;
import java.util.Map;

public class SyncPolicyManager {
    private Map<SyncType, IPolicy> mPolicies;

    private static class Singleton {
        /* access modifiers changed from: private */
        public static SyncPolicyManager sInstance = new SyncPolicyManager();
    }

    private SyncPolicyManager() {
        SyncType[] values;
        this.mPolicies = new HashMap();
        BackupPolicisStrategy backupPolicisStrategy = (BackupPolicisStrategy) CloudControlManager.getInstance().queryFeatureStrategy("backup-policies");
        Log.i("SyncPolicyManager", "policies %s", (Object) backupPolicisStrategy);
        for (SyncType syncType : SyncType.values()) {
            PolicyImpl policyImpl = new PolicyImpl(syncType, backupPolicisStrategy == null ? null : backupPolicisStrategy.getPolicy(syncType.getIdentifier()));
            addPolicy(policyImpl.getType(), policyImpl);
        }
    }

    public static SyncPolicyManager getInstance() {
        return Singleton.sInstance;
    }

    public void addPolicy(SyncType syncType, IPolicy iPolicy) {
        if (iPolicy != null) {
            this.mPolicies.put(syncType, iPolicy);
        }
    }

    public IPolicy getPolicy(SyncType syncType) {
        return (IPolicy) this.mPolicies.get(syncType);
    }
}
