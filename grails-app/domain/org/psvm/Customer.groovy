package org.psvm

class Customer {

    String name
    Date birthday
    String phoneNumber
    String addressNumber
    String addressStreet
    String addressComplement

    static hasMany = [customerOrders: CustomerOrder]

    static constraints = {
        phoneNumber nullable: true, blank: true
        addressNumber nullable: true, blank: true
        addressStreet nullable: true, blank: true
        addressComplement nullable: true, blank: true
    }

}
