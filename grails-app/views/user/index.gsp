<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Users</h1>
        </div>
    </content>

    <content tag="body">
        <div class="row">
            <div class="col-xs-3">
                <a class="btn btn-md btn-primary" href="/user/create">Add New User</a>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-xs-12">
                <div id="list-user" class="content scaffold-list" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <exa:datatable id="usertable" items="${userList}"
                                   hidden="springSecurityService,password,carts,dateCreated,hasMany,hasOne,id,isAdmin,lastUpdated,mapping,enabled,accountExpired,accountLocked,passwordExpired" >
                        <exa:customHeader name="name" value="Name"/>
                        <exa:customHeader name="lastname" value="Last Name"/>
                        <exa:customHeader name="state" value="State"/>
                        <exa:customHeader name="city" value="City"/>
                        <exa:customHeader name="address" value="Address"/>
                        <exa:customHeader name="zip" value="Zip Code"/>
                        <exa:customHeader name="email" value="Email Address"/>
                        <exa:customHeader name="userType" value="User Type"/>
                        <exa:customHeader name="department" value="Department"/>
                        <exa:customColumn name="department">
                            ${it.department}
                        </exa:customColumn>
                        <exa:customColumn name="email">
                            <a href="${createLink(controller: "user", action:"show", id: it.id)}">${it.email}</a>
                        </exa:customColumn>

                    </exa:datatable>
                </div>
            </div>
        </div>
    </content>
</g:applyLayout>