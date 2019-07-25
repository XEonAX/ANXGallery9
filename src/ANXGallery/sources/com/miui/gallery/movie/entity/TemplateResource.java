package com.miui.gallery.movie.entity;

import com.miui.gallery.movie.ui.factory.TemplateFactory;

public class TemplateResource extends MovieResource {
    public String getDownloadSrcPath() {
        return TemplateFactory.getTemplateDir(this.pathKey);
    }

    public String getStatNameString() {
        StringBuilder sb = new StringBuilder();
        sb.append("template-");
        sb.append(this.label);
        return sb.toString();
    }

    public String getStatTypeString() {
        return "template";
    }
}
