package org.psvm

class Product {

    String name
    String code
    BigDecimal defaultPrice
    BigDecimal salePrice
    ProductType type
    Integer stockQuantity
    byte[] picture

    static constraints = {
        picture(maxSize: 1024 * 1024)
    }

    enum ProductType {

        NECKLACE("Colar"),
        RING("Anel"),
        BRACELET("Pulseira"),
        ANKLET("Tornozeleira"),
        EARRING("Brinco"),
        PENDANT("Pingente")

        String friendlyName

        public ProductType(String friendlyName) {
            this.friendlyName = friendlyName
        }

    }
}
