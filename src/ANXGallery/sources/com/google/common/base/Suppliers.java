package com.google.common.base;

import java.io.Serializable;

public final class Suppliers {

    private static class SupplierOfInstance<T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;
        final T instance;

        SupplierOfInstance(T t) {
            this.instance = t;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof SupplierOfInstance)) {
                return false;
            }
            return Objects.equal(this.instance, ((SupplierOfInstance) obj).instance);
        }

        public T get() {
            return this.instance;
        }

        public int hashCode() {
            return Objects.hashCode(this.instance);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Suppliers.ofInstance(");
            sb.append(this.instance);
            sb.append(")");
            return sb.toString();
        }
    }

    public static <T> Supplier<T> ofInstance(T t) {
        return new SupplierOfInstance(t);
    }
}
