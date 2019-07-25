package com.miui.gallery.pendingtask;

import com.miui.gallery.assistant.library.DeleteLibraryTask;
import com.miui.gallery.assistant.library.LibraryDownloadTask;
import com.miui.gallery.assistant.process.ExistImageFeatureChargingTask;
import com.miui.gallery.assistant.process.ExistImageFeatureTask;
import com.miui.gallery.card.preprocess.ScenarioAlbumChargingTask;
import com.miui.gallery.card.preprocess.ScenarioAlbumTask;
import com.miui.gallery.cloudcontrol.CloudControlPendingTask;
import com.miui.gallery.discovery.PrintSilentInstallTask;
import com.miui.gallery.pendingtask.base.PendingTask;

public class PendingTaskFactory {
    public static PendingTask create(int i) {
        switch (i) {
            case 0:
                return null;
            case 2:
                return new ScenarioAlbumTask(i);
            case 3:
                return new CloudControlPendingTask(i);
            case 4:
                return new PrintSilentInstallTask(i);
            case 6:
                return new ExistImageFeatureTask(i);
            case 7:
                return new LibraryDownloadTask(i);
            case 8:
                return new DeleteLibraryTask(i);
            case 9:
                return new ExistImageFeatureChargingTask(i);
            case 10:
                return new ScenarioAlbumChargingTask(i);
            default:
                return null;
        }
    }
}
