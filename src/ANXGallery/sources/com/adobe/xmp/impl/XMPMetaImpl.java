package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPUtils;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.PropertyOptions;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.util.Iterator;

public class XMPMetaImpl implements XMPMeta {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private String packetHeader;
    private XMPNode tree;

    public XMPMetaImpl() {
        this.packetHeader = null;
        this.tree = new XMPNode(null, null, null);
    }

    public XMPMetaImpl(XMPNode xMPNode) {
        this.packetHeader = null;
        this.tree = xMPNode;
    }

    private Object evaluateNodeValue(int i, XMPNode xMPNode) throws XMPException {
        String value = xMPNode.getValue();
        switch (i) {
            case 1:
                return new Boolean(XMPUtils.convertToBoolean(value));
            case 2:
                return new Integer(XMPUtils.convertToInteger(value));
            case 3:
                return new Long(XMPUtils.convertToLong(value));
            case 4:
                return new Double(XMPUtils.convertToDouble(value));
            case 5:
                return XMPUtils.convertToDate(value);
            case 6:
                return XMPUtils.convertToDate(value).getCalendar();
            case 7:
                return XMPUtils.decodeBase64(value);
            default:
                if (value == null && !xMPNode.getOptions().isCompositeProperty()) {
                    value = "";
                }
                return value;
        }
    }

    public Object clone() {
        return new XMPMetaImpl((XMPNode) this.tree.clone());
    }

    public Integer getPropertyInteger(String str, String str2) throws XMPException {
        return (Integer) getPropertyObject(str, str2, 2);
    }

    /* access modifiers changed from: protected */
    public Object getPropertyObject(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        if (i == 0 || !findNode.getOptions().isCompositeProperty()) {
            return evaluateNodeValue(i, findNode);
        }
        throw new XMPException("Property must be simple when a value type is requested", BaiduSceneResult.TAEKWONDO);
    }

    public String getPropertyString(String str, String str2) throws XMPException {
        return (String) getPropertyObject(str, str2, 0);
    }

    public XMPNode getRoot() {
        return this.tree;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0096, code lost:
        throw new com.adobe.xmp.XMPException("Language qualifier must be first", com.miui.gallery.assistant.jni.filter.BaiduSceneResult.TAEKWONDO);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00cd, code lost:
        if (r3 != false) goto L_0x0159;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00e4, code lost:
        if (r3 != false) goto L_0x0159;
     */
    public void setLocalizedText(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        XMPNode xMPNode;
        boolean z;
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertSpecificLang(str4);
        String normalizeLangValue = str3 != null ? Utils.normalizeLangValue(str3) : null;
        String normalizeLangValue2 = Utils.normalizeLangValue(str4);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), true, new PropertyOptions(7680));
        if (findNode != null) {
            if (!findNode.getOptions().isArrayAltText()) {
                if (findNode.hasChildren() || !findNode.getOptions().isArrayAlternate()) {
                    throw new XMPException("Specified property is no alt-text array", BaiduSceneResult.TAEKWONDO);
                }
                findNode.getOptions().setArrayAltText(true);
            }
            Iterator iterateChildren = findNode.iterateChildren();
            while (true) {
                if (!iterateChildren.hasNext()) {
                    xMPNode = null;
                    z = false;
                    break;
                }
                xMPNode = (XMPNode) iterateChildren.next();
                if (xMPNode.hasQualifier() && "xml:lang".equals(xMPNode.getQualifier(1).getName())) {
                    if ("x-default".equals(xMPNode.getQualifier(1).getValue())) {
                        z = true;
                        break;
                    }
                }
            }
            if (xMPNode != null && findNode.getChildrenLength() > 1) {
                findNode.removeChild(xMPNode);
                findNode.addChild(1, xMPNode);
            }
            Object[] chooseLocalizedText = XMPNodeUtils.chooseLocalizedText(findNode, normalizeLangValue, normalizeLangValue2);
            int intValue = ((Integer) chooseLocalizedText[0]).intValue();
            XMPNode xMPNode2 = (XMPNode) chooseLocalizedText[1];
            boolean equals = "x-default".equals(normalizeLangValue2);
            switch (intValue) {
                case 0:
                    XMPNodeUtils.appendLangItem(findNode, "x-default", str5);
                    if (!equals) {
                        XMPNodeUtils.appendLangItem(findNode, normalizeLangValue2, str5);
                    }
                case 1:
                    if (equals) {
                        Iterator iterateChildren2 = findNode.iterateChildren();
                        while (iterateChildren2.hasNext()) {
                            XMPNode xMPNode3 = (XMPNode) iterateChildren2.next();
                            if (xMPNode3 != xMPNode) {
                                if (xMPNode3.getValue().equals(xMPNode != null ? xMPNode.getValue() : null)) {
                                    xMPNode3.setValue(str5);
                                }
                            }
                        }
                        if (xMPNode != null) {
                            xMPNode.setValue(str5);
                            break;
                        }
                    } else {
                        if (z && xMPNode != xMPNode2 && xMPNode != null && xMPNode.getValue().equals(xMPNode2.getValue())) {
                            xMPNode.setValue(str5);
                        }
                        xMPNode2.setValue(str5);
                        break;
                    }
                    break;
                case 2:
                    if (z && xMPNode != xMPNode2 && xMPNode != null && xMPNode.getValue().equals(xMPNode2.getValue())) {
                        xMPNode.setValue(str5);
                    }
                    xMPNode2.setValue(str5);
                    break;
                case 3:
                    XMPNodeUtils.appendLangItem(findNode, normalizeLangValue2, str5);
                    break;
                case 4:
                    if (xMPNode != null && findNode.getChildrenLength() == 1) {
                        xMPNode.setValue(str5);
                    }
                    XMPNodeUtils.appendLangItem(findNode, normalizeLangValue2, str5);
                    break;
                case 5:
                    XMPNodeUtils.appendLangItem(findNode, normalizeLangValue2, str5);
                    break;
                default:
                    throw new XMPException("Unexpected result from ChooseLocalizedText", 9);
            }
            z = true;
            if (!z && findNode.getChildrenLength() == 1) {
                XMPNodeUtils.appendLangItem(findNode, "x-default", str5);
                return;
            }
            return;
        }
        throw new XMPException("Failed to find or create array node", BaiduSceneResult.TAEKWONDO);
    }

    public void setPacketHeader(String str) {
        this.packetHeader = str;
    }
}
