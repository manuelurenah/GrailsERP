<g:applyLayout name="bootstrapTemplate">
    <content tag="body">
        <div class="jumbotron text-center">
            <h1>Users</h1>
        </div>

        <div class="row">
            <div class="col-xs-3">
                <a class="btn btn-md btn-primary" href="/user/create">Add New User</a>
            </div>
        </div>
        <br />

        <div id="list-user" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${userList}" />

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </content>
</g:applyLayout>