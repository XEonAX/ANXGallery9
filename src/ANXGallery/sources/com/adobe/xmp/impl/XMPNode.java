package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

class XMPNode implements Comparable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private boolean alias;
    private List children;
    private boolean hasAliases;
    private boolean hasValueChild;
    private boolean implicit;
    private String name;
    private PropertyOptions options;
    private XMPNode parent;
    private List qualifier;
    private String value;

    public XMPNode(String str, PropertyOptions propertyOptions) {
        this(str, null, propertyOptions);
    }

    public XMPNode(String str, String str2, PropertyOptions propertyOptions) {
        this.children = null;
        this.qualifier = null;
        this.options = null;
        this.name = str;
        this.value = str2;
        this.options = propertyOptions;
    }

    private void assertChildNotExisting(String str) throws XMPException {
        if (!"[]".equals(str) && findChildByName(str) != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Duplicate property or field node '");
            sb.append(str);
            sb.append("'");
            throw new XMPException(sb.toString(), 203);
        }
    }

    private void assertQualifierNotExisting(String str) throws XMPException {
        if (!"[]".equals(str) && findQualifierByName(str) != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Duplicate '");
            sb.append(str);
            sb.append("' qualifier");
            throw new XMPException(sb.toString(), 203);
        }
    }

    /* JADX WARNING: Incorrect type for immutable var: ssa=java.util.List, code=java.util.List<com.adobe.xmp.impl.XMPNode>, for r3v0, types: [java.util.List, java.util.List<com.adobe.xmp.impl.XMPNode>] */
    private XMPNode find(List<XMPNode> list, String str) {
        if (list != null) {
            for (XMPNode xMPNode : list) {
                if (xMPNode.getName().equals(str)) {
                    return xMPNode;
                }
            }
        }
        return null;
    }

    private List getChildren() {
        if (this.children == null) {
            this.children = new ArrayList(0);
        }
        return this.children;
    }

    private List getQualifier() {
        if (this.qualifier == null) {
            this.qualifier = new ArrayList(0);
        }
        return this.qualifier;
    }

    private boolean isLanguageNode() {
        return "xml:lang".equals(this.name);
    }

    private boolean isTypeNode() {
        return "rdf:type".equals(this.name);
    }

    public void addChild(int i, XMPNode xMPNode) throws XMPException {
        assertChildNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        getChildren().add(i - 1, xMPNode);
    }

    public void addChild(XMPNode xMPNode) throws XMPException {
        assertChildNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        getChildren().add(xMPNode);
    }

    public void addQualifier(XMPNode xMPNode) throws XMPException {
        assertQualifierNotExisting(xMPNode.getName());
        xMPNode.setParent(this);
        xMPNode.getOptions().setQualifier(true);
        getOptions().setHasQualifiers(true);
        if (xMPNode.isLanguageNode()) {
            this.options.setHasLanguage(true);
            getQualifier().add(0, xMPNode);
        } else if (xMPNode.isTypeNode()) {
            this.options.setHasType(true);
            getQualifier().add(this.options.getHasLanguage() ? 1 : 0, xMPNode);
        } else {
            getQualifier().add(xMPNode);
        }
    }

    /* access modifiers changed from: protected */
    public void cleanupChildren() {
        if (this.children.isEmpty()) {
            this.children = null;
        }
    }

    public Object clone() {
        PropertyOptions propertyOptions;
        try {
            propertyOptions = new PropertyOptions(getOptions().getOptions());
        } catch (XMPException unused) {
            propertyOptions = new PropertyOptions();
        }
        XMPNode xMPNode = new XMPNode(this.name, this.value, propertyOptions);
        cloneSubtree(xMPNode);
        return xMPNode;
    }

    public void cloneSubtree(XMPNode xMPNode) {
        try {
            Iterator iterateChildren = iterateChildren();
            while (iterateChildren.hasNext()) {
                xMPNode.addChild((XMPNode) ((XMPNode) iterateChildren.next()).clone());
            }
            Iterator iterateQualifier = iterateQualifier();
            while (iterateQualifier.hasNext()) {
                xMPNode.addQualifier((XMPNode) ((XMPNode) iterateQualifier.next()).clone());
            }
        } catch (XMPException unused) {
        }
    }

    public int compareTo(Object obj) {
        return getOptions().isSchemaNode() ? this.value.compareTo(((XMPNode) obj).getValue()) : this.name.compareTo(((XMPNode) obj).getName());
    }

    public XMPNode findChildByName(String str) {
        return find(getChildren(), str);
    }

    public XMPNode findQualifierByName(String str) {
        return find(this.qualifier, str);
    }

    public XMPNode getChild(int i) {
        return (XMPNode) getChildren().get(i - 1);
    }

    public int getChildrenLength() {
        if (this.children != null) {
            return this.children.size();
        }
        return 0;
    }

    public boolean getHasAliases() {
        return this.hasAliases;
    }

    public boolean getHasValueChild() {
        return this.hasValueChild;
    }

    public String getName() {
        return this.name;
    }

    public PropertyOptions getOptions() {
        if (this.options == null) {
            this.options = new PropertyOptions();
        }
        return this.options;
    }

    public XMPNode getParent() {
        return this.parent;
    }

    public XMPNode getQualifier(int i) {
        return (XMPNode) getQualifier().get(i - 1);
    }

    public int getQualifierLength() {
        if (this.qualifier != null) {
            return this.qualifier.size();
        }
        return 0;
    }

    public List getUnmodifiableChildren() {
        return Collections.unmodifiableList(new ArrayList(getChildren()));
    }

    public String getValue() {
        return this.value;
    }

    public boolean hasChildren() {
        return this.children != null && this.children.size() > 0;
    }

    public boolean hasQualifier() {
        return this.qualifier != null && this.qualifier.size() > 0;
    }

    public boolean isAlias() {
        return this.alias;
    }

    public boolean isImplicit() {
        return this.implicit;
    }

    public Iterator iterateChildren() {
        return this.children != null ? getChildren().iterator() : Collections.EMPTY_LIST.listIterator();
    }

    public Iterator iterateQualifier() {
        if (this.qualifier == null) {
            return Collections.EMPTY_LIST.iterator();
        }
        final Iterator it = getQualifier().iterator();
        return new Iterator() {
            public boolean hasNext() {
                return it.hasNext();
            }

            public Object next() {
                return it.next();
            }

            public void remove() {
                throw new UnsupportedOperationException("remove() is not allowed due to the internal contraints");
            }
        };
    }

    public void removeChild(int i) {
        getChildren().remove(i - 1);
        cleanupChildren();
    }

    public void removeChild(XMPNode xMPNode) {
        getChildren().remove(xMPNode);
        cleanupChildren();
    }

    public void removeChildren() {
        this.children = null;
    }

    public void removeQualifier(XMPNode xMPNode) {
        PropertyOptions options2 = getOptions();
        if (xMPNode.isLanguageNode()) {
            options2.setHasLanguage(false);
        } else if (xMPNode.isTypeNode()) {
            options2.setHasType(false);
        }
        getQualifier().remove(xMPNode);
        if (this.qualifier.isEmpty()) {
            options2.setHasQualifiers(false);
            this.qualifier = null;
        }
    }

    public void removeQualifiers() {
        PropertyOptions options2 = getOptions();
        options2.setHasQualifiers(false);
        options2.setHasLanguage(false);
        options2.setHasType(false);
        this.qualifier = null;
    }

    public void replaceChild(int i, XMPNode xMPNode) {
        xMPNode.setParent(this);
        getChildren().set(i - 1, xMPNode);
    }

    public void setAlias(boolean z) {
        this.alias = z;
    }

    public void setHasAliases(boolean z) {
        this.hasAliases = z;
    }

    public void setHasValueChild(boolean z) {
        this.hasValueChild = z;
    }

    public void setImplicit(boolean z) {
        this.implicit = z;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setOptions(PropertyOptions propertyOptions) {
        this.options = propertyOptions;
    }

    /* access modifiers changed from: protected */
    public void setParent(XMPNode xMPNode) {
        this.parent = xMPNode;
    }

    public void setValue(String str) {
        this.value = str;
    }
}
