package org.psvm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CustomerOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CustomerOrder.list(params), model:[customerOrderInstanceCount: CustomerOrder.count()]
    }

    def show(CustomerOrder customerOrderInstance) {
        respond customerOrderInstance
    }

    def create(Customer customer) {

        CustomerOrder customerOrder = new CustomerOrder(params)
        customerOrder.customer = customer

        respond customerOrder

    }

    @Transactional
    def save(CustomerOrder customerOrderInstance) {
        if (customerOrderInstance == null) {
            notFound()
            return
        }

        if (customerOrderInstance.hasErrors()) {
            respond customerOrderInstance.errors, view:'create'
            return
        }

        def firstIncome = params.firstIncome ? params.firstIncome as BigDecimal : null

        if(firstIncome) {

            Payment payment = new Payment(dateCreated: new Date(),
                    datePaid: new Date(),
                    amount: firstIncome,
                    installment: firstIncome >= customerOrderInstance.amount ? 1 : 0)

            customerOrderInstance.addToPayments(payment)

        }

        customerOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), customerOrderInstance.id])
                redirect customerOrderInstance
            }
            '*' { respond customerOrderInstance, [status: CREATED] }
        }
    }

    def edit(CustomerOrder customerOrderInstance) {
        respond customerOrderInstance
    }

    @Transactional
    def update(CustomerOrder customerOrderInstance) {
        if (customerOrderInstance == null) {
            notFound()
            return
        }

        if (customerOrderInstance.hasErrors()) {
            respond customerOrderInstance.errors, view:'edit'
            return
        }

        customerOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CustomerOrder.label', default: 'CustomerOrder'), customerOrderInstance.id])
                redirect customerOrderInstance
            }
            '*'{ respond customerOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CustomerOrder customerOrderInstance) {

        if (customerOrderInstance == null) {
            notFound()
            return
        }

        customerOrderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CustomerOrder.label', default: 'CustomerOrder'), customerOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
