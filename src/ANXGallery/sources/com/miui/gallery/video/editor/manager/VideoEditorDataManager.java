package com.miui.gallery.video.editor.manager;

import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.video.editor.LocalAudio;
import com.miui.gallery.video.editor.SmartEffect;
import com.miui.gallery.video.editor.TextStyle;
import com.miui.gallery.video.editor.factory.AudioFactory;
import com.miui.gallery.video.editor.factory.VideoEditorModuleFactory;
import com.miui.gallery.video.editor.model.LocalResource;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class VideoEditorDataManager {
    public static ArrayList<LocalAudio> loadAudioData(VideoEditorModuleFactory videoEditorModuleFactory, List<LocalResource> list) {
        ArrayList<LocalAudio> arrayList = new ArrayList<>();
        if (MiscUtil.isValid(list)) {
            for (LocalResource localResource : list) {
                if (localResource != null) {
                    LocalAudio localAudio = new LocalAudio(localResource);
                    if (videoEditorModuleFactory != null && (videoEditorModuleFactory instanceof AudioFactory)) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(videoEditorModuleFactory.getTemplateDir(localResource.id));
                        sb.append(File.separator);
                        sb.append(localAudio.getFileName());
                        String sb2 = sb.toString();
                        if (new File(sb2).exists()) {
                            localAudio.setDownloadState(17);
                            localAudio.setSrcPath(sb2);
                        }
                    }
                    arrayList.add(localAudio);
                }
            }
        }
        return arrayList;
    }

    public static ArrayList<SmartEffect> loadSmartEffects(List<LocalResource> list) {
        ArrayList<SmartEffect> arrayList = new ArrayList<>();
        if (MiscUtil.isValid(list)) {
            for (LocalResource localResource : list) {
                if (localResource != null) {
                    arrayList.add(new SmartEffect(localResource));
                }
            }
        }
        return arrayList;
    }

    public static ArrayList<TextStyle> loadWaterMarks(List<LocalResource> list) {
        ArrayList<TextStyle> arrayList = new ArrayList<>();
        if (MiscUtil.isValid(list)) {
            for (LocalResource localResource : list) {
                if (localResource != null && (!BuildUtil.isInternational() || localResource.isInternational())) {
                    arrayList.add(new TextStyle(localResource));
                }
            }
        }
        return arrayList;
    }
}
