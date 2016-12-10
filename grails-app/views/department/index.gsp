<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Departments</h1>
        </div>
    </content>

    <content tag="body">
        <div class="row">
            <div class="col-xs-3">
                <a class="btn btn-md btn-primary" href="/department/create">Add New Department</a>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-xs-12">
                <div id="list-department" class="content scaffold-list" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <exa:datatable include="title" id="depts" items="${departmentList}">
                        <exa:customHeader name="title" value="Title"/>
                        <exa:customColumn name="title">
                            <a href="${g.createLink(controller:'department', action:"show", id:it.id)}">
                                ${it.title}
                            </a>
                        </exa:customColumn>
                    </exa:datatable>
                </div>
            </div>
        </div>
    </content>
</g:applyLayout>