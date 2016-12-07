<g:applyLayout name="bootstrapTemplate">
    <content tag="body">
        <div id="show-user" class="content scaffold-show" role="main">
            <h1>User Fields</h1>
            <g:link class="btn btn-warning pull-right" action="index">
                <g:message code="default.button.back.label" default="Back" />
            </g:link>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="user" templates="bootstrap3"/>
            <g:form resource="${this.user}" method="DELETE">
                <div class="col-xs-6">
                    <g:link class="btn btn-block btn-info" action="edit" resource="${this.user}">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                </div>
                <div class="col-xs-6">
                    <input class="btn btn-block btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </div>
            </g:form>
        </div>
    </content>
</g:applyLayout>