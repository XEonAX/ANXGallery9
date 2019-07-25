package com.miui.gallery.movie.ui.factory;

import com.miui.gallery.R;
import com.miui.gallery.movie.MovieConfig;
import com.miui.gallery.movie.entity.TemplateResource;
import com.miui.gallery.movie.utils.MovieStatUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class TemplateFactory {
    public static List<TemplateResource> getLocalTemplateEntities() {
        ArrayList arrayList = new ArrayList();
        TemplateResource templateResource = new TemplateResource();
        templateResource.imageId = R.drawable.movie_template_default;
        templateResource.stringId = R.string.movie_template_normal;
        templateResource.isPackageAssets = true;
        templateResource.nameKey = MovieStatUtils.FROM_NORMAL;
        templateResource.downloadState = 17;
        arrayList.add(templateResource);
        return arrayList;
    }

    public static String getTemplateDir(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(MovieConfig.sTemplateDir);
        sb.append(File.separator);
        sb.append(str);
        return sb.toString();
    }
}
