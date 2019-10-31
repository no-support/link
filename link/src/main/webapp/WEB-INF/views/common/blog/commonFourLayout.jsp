<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-4">
				<span class="blog_manage_title">레이아웃 & 위젯 설정</span>
			</div>
			<div class="col-sm-12">
				<hr class="blog_manage_hr1" />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row blog_layout_row1">
				<a href="beautifyblog.do">
					<div class="col-sm-2" id="layout1">
						<div class="layout_div2">
							<div class="layout_row1 ${selected eq 'first' ? 'greenLight' : ''}"></div>
							<div class="layout_row2"></div>
							<div class="layout_row3"></div>
							<div class="layout_row4"></div>
						</div>
					</div>
				</a>
				<a href="beautifyblog2.do">
					<div class="col-sm-2" id="layout2">
						<div class="layout_div2">
							<div class="layout_row1 ${selected eq 'second' ? 'greenLight' : ''}"></div>
							<div class="layout_row2"></div>
							<div class="layout_row5"></div>
							<div class="layout_row6"></div>
						</div>
					</div>
				</a>
				<a href="beautifyblog3.do">
					<div class="col-sm-2" id="layout3">
						<div class="layout_div2">
							<div class="layout_row1 ${selected eq 'third' ? 'greenLight' : ''}"></div>
							<div class="layout_row2"></div>
							<div class="layout_row9"></div>
							<div class="layout_row10"></div>
						</div>
					</div>
				</a>
				<a href="beautifyblog4.do">
					<div class="col-sm-2" id="layout4">
						<div class="layout_div2">
							<div style="margin-top:0px;" class="layout_row9"></div>
							<div class="layout_row10"></div>
							<div style="margin-top:3px;" class="layout_row1 ${selected eq 'fourth' ? 'greenLight' : ''}"></div>
							<div class="layout_row2"></div>
						</div>
					</div>
				</a>
				</div>
			</div>
		</div>
	</div>
</div>