<?php
{assign var="data" value=$entityData['struct'][$entityKey]}

namespace {$entityData['moduleNamespace']}\entities;

use mpcmf\modules\moduleBase\entities\entityBase;
use mpcmf\system\pattern\singleton;
use {$entityData['moduleNamespace']}\mappers\{$entityData['name']}Mapper;

/**
 * Class {$data['className']}
 *
{if !empty($entityData['description'])}
 * {$entityData['description']|replace:"\n":"\n * "}
 *
{/if}
{include file="generator.tpl"}
 *
 * @package {$entityData['moduleNamespace']}\entities
 *
{foreach from=$entityData['authors'] item='author'}
 * @author {$author['name']} <{$author['email']}>
{/foreach}
 *
 * @method {$entityData['name']}Mapper getMapper
 */
class {$data['className']}
    extends entityBase
{

    use singleton;
}