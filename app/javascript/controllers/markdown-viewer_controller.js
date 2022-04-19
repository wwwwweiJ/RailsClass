import { marked } from "marked"
import { Controller } from "stimulus"




export default class extends Controller {
    initialize(){
        this.content = ""
    }
    connect(){
        this.content = this.element.textContent
        this.element.innerHTML = marked.parse(this.content)
    }
    disconnect(){
        this.element.textContent = this.content
    }
}