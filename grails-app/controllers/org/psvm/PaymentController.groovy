package org.psvm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PaymentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Payment.list(params), model:[paymentInstanceCount: Payment.count()]
    }

    def show(Payment paymentInstance) {
        respond paymentInstance
    }

    def create(CustomerOrder customerOrder) {
        Payment payment = new Payment(params)
        payment.customerOrder = customerOrder

        Integer currentInstallment = customerOrder.payments.installment.max { it }
        payment.installment = currentInstallment ? currentInstallment + 1 : 1

        respond payment
    }

    @Transactional
    def save(Payment paymentInstance) {
        if (paymentInstance == null) {
            notFound()
            return
        }

        if (paymentInstance.hasErrors()) {
            respond paymentInstance.errors, view:'create'
            return
        }

        paymentInstance.save flush:true

        flash.message = "Pagamento adicionado com sucesso."
        redirect(controller: 'customerOrder', action: 'show', id: paymentInstance.customerOrder.id)
    }

    def edit(Payment paymentInstance) {
        respond paymentInstance
    }

    @Transactional
    def update(Payment paymentInstance) {
        if (paymentInstance == null) {
            notFound()
            return
        }

        if (paymentInstance.hasErrors()) {
            respond paymentInstance.errors, view:'edit'
            return
        }

        paymentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Payment.label', default: 'Payment'), paymentInstance.id])
                redirect paymentInstance
            }
            '*'{ respond paymentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Payment paymentInstance) {

        if (paymentInstance == null) {
            notFound()
            return
        }

        paymentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Payment.label', default: 'Payment'), paymentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
