<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="_header.master" Inherits="WebApplication1.side_navigation_bar"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <aside class="app-sidebar">
     
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="instruction.aspx"><span class="app-menu__label">Instruction</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="spconfig.aspx" data-toggle="treeview"><span class="app-menu__label">Configure IDP</span></a>
        </li>
        <li><a class="app-menu__item" href="idpconfig.aspx" data-toggle="treeview"><span class="app-menu__label">Configure SP</span></a></li>
        
        <li class="treeview"><a class="app-menu__item" href="attributemapping.aspx" data-toggle="treeview"><span class="app-menu__label">Attribute Mapping</span></a>
        </li>
        <li class="treeview"><a class="app-menu__item" href="loginsetup.aspx" data-toggle="treeview"><span class="app-menu__label">Login Setup</span></a>
        </li>
      </ul>
    </aside>

    <style>
.app-menu__item {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 12px 15px;
  font-size: 1.08em;
  border-left: 3px solid transparent;
  -webkit-transition: border-left-color 0.3s ease,
 background-color 0.3s ease;
  -o-transition: border-left-color 0.3s ease,
 background-color 0.3s ease;
  transition: border-left-color 0.3s ease,
 background-color 0.3s ease;
  color: #fff;
}

.app-menu__item.active, .app-menu__item:hover, .app-menu__item:focus {
  background: #0d1214;
  border-left-color: #009688;
  text-decoration: none;
  color: #fff;
}

.app-menu__icon {
  -webkit-box-flex: 0;
      -ms-flex: 0 0 auto;
          flex: 0 0 auto;
  width: 25px;
}

.app-menu__label {
  white-space: nowrap;
  -webkit-box-flex: 1;
      -ms-flex: 1 1 auto;
          flex: 1 1 auto;
}

 .sidebar-mini.sidenav-toggled .app-menu__item {
    overflow: hidden;
  }
  .sidebar-mini.sidenav-toggled .app-menu__item:hover {
    overflow: visible;
  }
  .sidebar-mini.sidenav-toggled .app-menu__item:hover .app-menu__label {
    opacity: 1;
  }
  .sidebar-mini.sidenav-toggled .app-menu__item:hover + .treeview-menu {
    visibility: visible;
  }
  .sidebar-mini.sidenav-toggled .app-menu__label {
    display: block;
    position: absolute;
    top: 0;
    left: 50px;
    min-width: 180px;
    padding: 12px 5px 12px 20px;
    margin-left: -3px;
    line-height: 1;
    opacity: 0;
    background: #0d1214;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
  }
  .sidebar-mini.sidenav-toggled .treeview:hover .app-menu__item {
    overflow: visible;
    background: #0d1214;
    border-left-color: #009688;
    color: #fff;
  }

  .list-unstyled, .app-nav, .app-menu, .treeview-menu {
        padding-left: 0;
        list-style: none;
    }
    .app-menu {
  margin-bottom: 0;
  padding-bottom: 40px;
}


  

  .treeview.is-expanded [data-toggle='treeview'] {
  border-left-color: #009688;
  background: #0d1214;
}

.treeview.is-expanded .treeview-menu {
  max-height: 100vh;
}

.treeview.is-expanded .treeview-indicator {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}

.treeview-menu {
  max-height: 0;
  overflow: hidden;
  -webkit-transition: max-height 0.3s ease;
  -o-transition: max-height 0.3s ease;
  transition: max-height 0.3s ease;
  background: #2a383e;
}

.treeview-item {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 5px 5px 5px 20px;
  font-size: 1em;
  color: #fff;
}

.treeview-item.active, .treeview-item:hover, .treeview-item:focus {
  background: #0d1214;
  text-decoration: none;
  color: #fff;
}

.treeview-item .icon {
  margin-right: 5px;
}

.treeview-indicator {
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center;
  -webkit-transition: -webkit-transform 0.3s ease;
  transition: -webkit-transform 0.3s ease;
  -o-transition: transform 0.3s ease;
  transition: transform 0.3s ease;
  transition: transform 0.3s ease, -webkit-transform 0.3s ease;
}
@media (min-width: 768px) {
  .sidebar-mini.sidenav-toggled .app-sidebar__user-name,
  .sidebar-mini.sidenav-toggled .app-sidebar__user-designation,
  .sidebar-mini.sidenav-toggled .treeview-indicator {
    display: none;
  }
  .sidebar-mini.sidenav-toggled .app-sidebar__user-avatar {
    width: 30px;
    height: 30px;
  }
  .sidebar-mini.sidenav-toggled .app-content {
    margin-left: 50px;
  }
  .sidebar-mini.sidenav-toggled .app-sidebar {
    left: 0;
    width: 50px;
    overflow: hidden;
  }
  .sidebar-mini.sidenav-toggled .app-sidebar:hover {
    overflow: visible;
  }
  
 

  .sidebar-mini.sidenav-toggled .app-menu__label {
    display: block;
    position: absolute;
    top: 0;
    left: 50px;
    min-width: 180px;
    padding: 12px 5px 12px 20px;
    margin-left: -3px;
    line-height: 1;
    opacity: 0;
    background: #0d1214;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
  }
  .sidebar-mini.sidenav-toggled .treeview:hover .app-menu__item {
    overflow: visible;
    background: #0d1214;
    border-left-color: #009688;
    color: #fff;
  }
  .sidebar-mini.sidenav-toggled .treeview:hover .app-menu__label {
    opacity: 1;
  }
  .sidebar-mini.sidenav-toggled .treeview:hover .treeview-menu {
    max-height: 100vh;
    opacity: 1;
    visibility: visible;
    z-index: 10;
  }
  .sidebar-mini.sidenav-toggled .treeview .app-menu__label {
    border-bottom-right-radius: 0;
  }
  .sidebar-mini.sidenav-toggled .treeview-menu {
    position: absolute;
    left: 50px;
    min-width: 180px;
    padding: 12px 0;
    opacity: 0;
    border-bottom-right-radius: 4px;
    z-index: 9;
    visibility: hidden;
    -webkit-transition: visibility 0.3s ease;
    -o-transition: visibility 0.3s ease;
    transition: visibility 0.3s ease;
  }
}
    </style>

</asp:Content>

