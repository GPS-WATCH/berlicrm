<!DOCTYPE html>
{strip}
<head>
	<title>{$_MODULE->label()} {vtranslate('LBL_LIST', 'crmtogo')}</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<link REL="SHORTCUT ICON" HREF="../../layouts/vlayout/modules/crmtogo/resources/images/favicon.ico">
	<link rel="stylesheet" href="../../layouts/vlayout/modules/crmtogo/resources/css/jquery.mobile-1.4.5.min.css">	
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/jquery.mobile-1.4.5.min.js"></script>
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/getScrollcontent.js"></script>
	<link rel="stylesheet" href="../../layouts/vlayout/modules/crmtogo/resources/css/jquery.mobile.structure-1.4.5.min.css" >
	<link rel="stylesheet" href="../../layouts/vlayout/modules/crmtogo/resources/css/jquery.mobile.icons.min.css" >
	<link rel="stylesheet" href="../../layouts/vlayout/modules/crmtogo/resources/css/theme.css" >
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/crmtogo.js"></script>
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/lang/{$LANGUAGE}.lang.js"></script>
	<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/xdate.js"></script>
	{if $_MODULE->name() eq 'Calendar'}
		<link rel="stylesheet" href="../../layouts/vlayout/modules/crmtogo/resources/css/jw-jqm-cal.css" >
		<script type="text/javascript" src="../../layouts/vlayout/modules/crmtogo/resources/jw-jqm-cal.js"></script>
	{/if}
</head>
<body>
<div data-role="page" data-theme="b"  id="list_page">
	<input type="hidden" name="modulename" id="modulename" value="{$_MODULE->name()}">
	<input type="hidden" name="pagerlimit" id="pagerlimit" value="{$PAGELIMIT}">
	<input type="hidden" name="view" id="view" value="{$_VIEW}">
	<input type="hidden" name="viewName" id="viewName" value="{$_VIEWNAME}">
	<!-- Calendar Settings -->
	{if $_MODULE->name() eq 'Calendar'}
	<input type="hidden" name="calendarselect" id="calendarselect" value="{$CALENDARSELECT}">
	<input type="hidden" name="cal_startday" id="cal_startday" value="{$CALSTARTDAY}">
	{/if}
	<!-- header -->
	<div data-role="header" data-theme="{$COLOR_HEADER_FOOTER}" data-position="fixed">
		{if $_MODULE->name() eq 'Calendar'}
			<div style="position: absolute;right: 35px;text-align: right;"> 
				<select name="fliptoggle" id="fliptoggle" data-role="slider" data-mini='true'> 
					<option value="off">{vtranslate('LBL_OFF', 'crmtogo')}</option> 
					<option value="on">{vtranslate('LBL_ON', 'crmtogo')}</option> 
				</select> 
			</div> 
			<div style="position: absolute;left: 35px;text-align: right;">
				<select id="scopetoggle" name="scopetoggle" data-mini="true" class="select" data-native-menu="false">
					<option value="month" >{vtranslate('LBL_MONTH', 'crmtogo')}</option>
					<option value="week" >{vtranslate('LBL_WEEK', 'crmtogo')}</option>
				</select>
			</div>
		{/if}
		{if $_MODULE->name() neq 'Calendar' AND $_MODULE->name() neq 'Quotes' AND  $_MODULE->name() neq 'SalesOrder' AND  $_MODULE->name() neq 'Invoice' AND  $_MODULE->name() neq 'PurchaseOrder' AND  $_MODULE->name() neq 'Products'}
			<a href="?_operation=create&module={$_MODULE->name()}&record=''" class="ui-btn ui-corner-all ui-icon-plus ui-btn-icon-notext" data-transition="turn" data-prefetch>{vtranslate('LBL_NEW', 'crmtogo')}</a>
		{elseif $_MODULE->name() eq 'Calendar'}
			<!-- select task or event -->
			<a href="?_operation=createActivity&lang={$LANGUAGE}" class="ui-btn ui-corner-all ui-icon-plus ui-btn-icon-notext" data-transition="turn" data-prefetch>{vtranslate('LBL_NEW', 'crmtogo')}</a>
		{/if}
		<a href="#panelmenu" data-mini='true' data-role='button' class="ui-btn ui-corner-all ui-icon-grid ui-btn-icon-notext"></a>
		<h4>{$_MODULE->label()}</h4> 
	</div>
	<!-- /header -->
	{if $_MODULE->name() eq 'Calendar'}	
	<div id="eventCalendarNoCache" class="ui-input-text ui-body-c" width="100%"></div>
	<div  id="view-calendar" data-theme="a">
		<div id="calendardiv" style="display:block;" >
			<div id="calendarcontainer">
			</div>
		</div>
	</div>
	{/if}
	<div data-role="content">
		<SELECT NAME="viewname" id="viewname" class="select" data-native-menu="false" style ="display:none"  >{$_CUSTOMVIEW_OPTION}</SELECT>
	</div>

	<!-- Search input -->
	<div id="searchInputField" style="display:none">
		<input id="inputer" class="ui-input-text ui-body-c" placeholder="Filter ..." data-type="search">
		<div data-role="collapsible-set" data-mini="true">
			<ul class="ui-listview ui-group-theme-c" data-role="listview" data-theme="c" data-filter="false">
				{literal}
				<style type="text/css">
				#content .content li a.ui-btn {
					margin: 0px;
					display: block;
					position: relative;
					text-align: left;
					text-overflow: ellipsis;
					overflow: hidden;
					white-space: nowrap;
					border-width: 1px 0px 0px;
					border-style: solid;
				}
				#content .content li:last-child a.ui-btn {
					border-bottom-width:1px;
				}
				</style>
				{/literal}
				<!-- graphical calendar -->
				<div id="content"></div>
			</ul>
		</div>
	</div>
	<div data-role="footer" data-theme="{$COLOR_HEADER_FOOTER}" data-position="fixed">
		<h1></h1>
	</div>
	{include file="layouts/vlayout/modules/crmtogo/PanelMenu.tpl"}
</div>
</body>
{/strip}